# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: soloturn@gmail.com
# Contributor: Ivan Naumeiko <Ivan.Naumeiko  AT gmail DOT com>

pkgname=knownreader
pkgver=20220407
pkgrel=1
pkgdesc='Fast and small XML/CSS based eBook reader'
arch=('x86_64')
url='https://github.com/plotn/coolreader'
license=('GPL2')
depends=('fribidi' 'hicolor-icon-theme' 'libunibreak' 'qt5-base')
makedepends=('cmake' 'ninja' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/plotn/coolreader/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(
  'SKIP'
)

build() {
  cmake coolreader-$pkgver -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGUI=QT5 \
    -DMAX_IMAGE_SCALE_MUL=2 \
    -DDOC_DATA_COMPRESSION_LEVEL=3 \
    -DDOC_BUFFER_SIZE=0x140000
  cmake --build build
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}

