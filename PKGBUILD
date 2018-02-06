# Maintainer: enihcam <nanericwang at the google email domain which is .com>
# Contributor: enihcam <nanericwang at the google email domain which is .com>

pkgname=chakracore
pkgver=1.8.0
pkgrel=1
pkgdesc='ChakraCore is the core part of the Chakra Javascript engine that powers Microsoft Edge'
arch=('x86_64')
url='https://github.com/Microsoft/ChakraCore'
license=('MIT')
depends=('icu')
makedepends=('cmake' 'clang' 'python2')
provides=('libChakraCore.so')
source=("https://github.com/Microsoft/ChakraCore/archive/v${pkgver}.tar.gz")
sha256sums=('af85cf9c1f3a32fef0f586842f468bf18158567c4b098b0a917bde7b386b90cc')

build() {
  cd "$srcdir/ChakraCore-${pkgver}"
  sed -i 's|python|python2|' ./build.sh
  ./build.sh
}

package() {
  cd "$srcdir/ChakraCore-${pkgver}/out/Release"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/include"
  mkdir -p "${pkgdir}/usr/lib"
  cp "$srcdir/ChakraCore-${pkgver}/out/Release/bin/ChakraCore/libChakraCore.so" "${pkgdir}/usr/lib"
  cp "$srcdir/ChakraCore-${pkgver}/out/Release/include/"*.h "${pkgdir}/usr/include/."
}
