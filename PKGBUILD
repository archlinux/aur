# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=flwm-git
_pkgname=flwm
pkgver=1.16.r0.g02904d9
pkgrel=1
pkgdesc="Fast Light Window Manager"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/flwm"
license=('GPL')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('fltk')
source=("${pkgname}::git+https://github.com/bbidulock/flwm.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  install -Dm755 flwm "${pkgdir}/usr/bin/flwm"
  install -Dm644 flwm.1 "${pkgdir}/usr/share/man/man1/flwm.1"
  install -Dm644 flwm.desktop "$pkgdir/usr/share/xsessions/flwm.desktop"
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/flwm.png"
}

# vim:set ts=2 sw=2 et:
