# Maintainer: Brian Bidulock <bidulock@openss7.org>

# This package is not named -git because there are no releases for xsettingsd.
pkgname=xsettingsd
pkgver=r86
pkgrel=1
epoch=1
pkgdesc="xsettingsd is a daemon that implements the XSETTINGS specification."
arch=('i686' 'x86_64')
url="http://code.google.com/p/xsettingsd/"
license=('custom:BSD')
depends=('libx11')
makedepends=('git' 'scons')
source=("git+https://github.com/derat/xsettingsd.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd ${pkgname}
  env CPPFLAGS="$CXXFLAGS" scons xsettingsd dump_xsettings
}

package() {
  cd ${pkgname}
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -d ${pkgdir}/usr/share/man/man1
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/
  install -m 755 dump_xsettings ${pkgdir}/usr/bin/
  install -m 644 xsettingsd.1 ${pkgdir}/usr/share/man/man1/
  install -m 644 dump_xsettings.1 ${pkgdir}/usr/share/man/man1/
  install -m 644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/
}
