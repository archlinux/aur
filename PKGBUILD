# Maintainer: Peter Spiess-Knafl <dev@spiessknafl.at>
# Contributor: Daniel Bomar <dbdaniel42@gmail.com>
pkgname=libjson-rpc-cpp
pkgver=1.0.0
pkgrel=1
pkgdesc="C++ framework for json-rpc 1.0 and 2.0"
arch=('i686' 'x86_64')
url="https://github.com/cinemast/libjson-rpc-cpp"
license=('MIT')
depends=('curl' 'argtable' 'jsoncpp' 'libmicrohttpd' 'hiredis')
makedepends=('cmake')
#checkdepends=('libcatch-cpp-headers')
install=libjson-rpc-cpp.install
changelog=ChangeLog
source=('https://github.com/cinemast/libjson-rpc-cpp/archive/v1.0.0.tar.gz')
sha256sums=('888c10f4be145dfe99e007d5298c90764fb73b58effb2c6a3fc522a5b60a18c6')

prepare() {
 cd "${srcdir}"/${pkgname}-${pkgver}
}

build() {
  msg2 "Creating build directories"
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build
  msg2 "Invoking cmake"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_STATIC_LIBS=TRUE -DCOMPILE_TESTS=FALSE  -DCOMPILE_EXAMPLES=FALSE ..
  msg2 "Building the framework"
  make
}

package() {
  cd $pkgname-$pkgver/build
  msg2 "Packing all together"
  make DESTDIR="${pkgdir}" install
  msg2 "Add MIT License to package"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
