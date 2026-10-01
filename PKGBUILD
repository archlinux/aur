# Maintainer: gimletlove

pkgname=imagecompare
pkgver=1.4.0
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
sha256sums=('7f0ae6c18d2f4ea35707f16034ffca983690dc6f55dae9610aa9807d83ecaf8b')

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
