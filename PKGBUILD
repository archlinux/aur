# Maintainer: enihcam <nanericwang at the google email domain which is .com>
# Contributor: enihcam <nanericwang at the google email domain which is .com>

pkgname=chakracore
pkgver=1.8.4
pkgrel=1
pkgdesc='ChakraCore is the core part of the Chakra Javascript engine that powers Microsoft Edge'
arch=('x86_64')
url='https://github.com/Microsoft/ChakraCore'
license=('MIT')
depends=('icu57')
makedepends=('cmake' 'clang' 'python2')
provides=('libChakraCore.so')
source=("https://github.com/Microsoft/ChakraCore/archive/v${pkgver}.tar.gz")
sha256sums=('1a51bdd4e3f5d363b3f68bf947f114a4822ab6c45d062df5ab2050f76944fb56')

build() {
  cd "$srcdir/ChakraCore-${pkgver}"
  sed -i 's|python|python2|' ./build.sh
  ./build.sh --jobs=$(nproc)
}

package() {
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/include"
  cp "$srcdir/ChakraCore-${pkgver}/out/Release/bin/ChakraCore/libChakraCore.so" "${pkgdir}/usr/lib"
  cp "$srcdir/ChakraCore-${pkgver}/out/Release/include/"*.h "${pkgdir}/usr/include/."
}
