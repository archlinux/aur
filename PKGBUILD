# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cubegui
_version=4.6
_patch=
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="Performance report explorer for displaying a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('qt5-base' 'cubelib')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
sha256sums=('1871c6736121d94a22314cb5daa8f3cbb978b58bfe54f677c4c9c9693757d0c5')

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
