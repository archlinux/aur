# Maintainer: smrqdt <smrqdt@posteo.de>
# Derived from cutecom PKGBUILD by:
#   Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
#   Contributor: Nils Bars <nils@nbars.de>

pkgname=cutecom-git
pkgver=0.51.0.r14.ge840840
pkgrel=1
pkgdesc="A graphical serial terminal (git master)"
arch=('x86_64')
url="https://gitlab.com/cutecom/cutecom"
license=('GPL3')
conflicts=('cutecom')
depends=('qt5-serialport')
makedepends=('cmake')
source=(${pkgname}::git+https://gitlab.com/cutecom/cutecom.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/$pkgname

  cmake .
  make || return 1
}

package() {
  cd ${srcdir}/$pkgname
  install -D -m 644 cutecom.desktop ${pkgdir}/usr/share/applications/cutecom.desktop
  install -D -m 644 images/cutecom.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutecom.svg
  install -D -m 755 cutecom ${pkgdir}/usr/bin/cutecom
  install -D -m 644 cutecom.1 ${pkgdir}/usr/share/man/man1/cutecom.1
}

