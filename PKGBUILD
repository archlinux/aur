pkgname=chakaracore
pkgver=1.4.0
pkgrel=2
pkgdesc="the core part of the Chakra Javascript engine that powers Microsoft Edge"
arch=('any')
url="https://github.com/Microsoft/ChakraCore"
license=('MIT')
depends=('cmake'
	'clang'
	'icu')
source=("https://github.com/Microsoft/ChakraCore/archive/v${pkgver}.tar.gz")
md5sums=('d6777fce9377078b902feddcbff352f3')

build() {
  cd "$srcdir/ChakraCore-${pkgver}"
  ./build.sh
}

package() {
  cd "$srcdir/ChakraCore-${pkgver}/BuildLinux/Release"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/include"
  mkdir -p "${pkgdir}/usr/lib"
  cp "$srcdir/ChakraCore-${pkgver}/BuildLinux/Release/bin/ChakraCore/libChakraCore.so" "${pkgdir}/usr/lib"
  cp "$srcdir/ChakraCore-${pkgver}/lib/Jsrt/"*.h "${pkgdir}/usr/include/."  
}

