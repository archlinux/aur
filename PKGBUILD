# Maintainer: gimletlove

pkgname=imagecompare
pkgver=1.3.0
pkgrel=1
pkgdesc='Image Compare is a desktop image comparison and visual diff tool.'
arch=('x86_64')
url='https://github.com/gimletlove/imagecompare'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja')
optdepends=(
  'qt6-svg: SVG image support'
  'qt6-imageformats: WebP and TIFF image support'
  'kimageformats: AVIF, JPEG XL, HEIC/HEIF, and more'
)
source=("$pkgname-$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('d5576488ae5700b59622b65ddee8b83eaad5a086a5c4afb8f54785454f66f79a')

build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B "$srcdir/$pkgname-$pkgver/build" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$srcdir/$pkgname-$pkgver/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver/build"
}
