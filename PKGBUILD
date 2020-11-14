# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmpbf
pkgver=1.4.0
pkgrel=2
pkgdesc="A library to support OpenStreetMap's protocolbuffer binary format (OSM PBF)"
arch=('i686' 'x86_64')
url="https://github.com/openstreetmap/OSM-binary"
license=('LGPL3')
depends=('protobuf')
makedepends=('git')
_gitname='OSM-binary'
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstreetmap/$_gitname/archive/v$pkgver.tar.gz"
    https://github.com/openstreetmap/OSM-binary/commit/09845ca4087c7404b1de33914233dbf53f9de4c3.patch)

prepare() {
  cd "$srcdir/$_gitname-$pkgver"
  patch -p1 < "$srcdir/09845ca4087c7404b1de33914233dbf53f9de4c3.patch"
}

build() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make
}

package() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

sha256sums=('be634444d10ad23c127946e0aa7a44bd2d975fc89f53fc022e7504221fbc2cae'
            'b2abaa5deeadb075bc97aa2de0ea6449c8b684d91120e5c8cc3f70c2eaf61c01')
