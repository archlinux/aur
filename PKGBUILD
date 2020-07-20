# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubegui
_version=4.5
_patch=
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="Performance report explorer for displaying a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('qt5-base' 'cubelib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
sha256sums=('ffe84108adce0adf06dca80820d941b1a60a5580a8bacc8f7c1b6989c8ab1bfa')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  ./configure --prefix=/usr
  sed -i -e 's/--as-needed,//' Makefile build-frontend/Makefile
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
