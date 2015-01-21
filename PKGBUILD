# Maintainer: Peter Spiess-Knafl <psk@autistici.org>
# Contributor: Daniel Bomar <dbdaniel42@gmail.com>
pkgname=libjson-rpc-cpp
pkgver=0.5.0
pkgrel=1
pkgdesc="C++ framework for json-rpc 1.0 and 2.0"
arch=('i686' 'x86_64')
url="https://github.com/cinemast/libjson-rpc-cpp"
license=('MIT')
depends=('curl' 'argtable' 'jsoncpp' 'libmicrohttpd')
makedepends=('cmake')
checkdepends=('boost')
install=libjson-rpc-cpp.install
changelog=ChangeLog
source=('https://github.com/cinemast/libjson-rpc-cpp/archive/v0.5.0.tar.gz')
sha256sums=('e6d8d6c20517bb38eba9dba7f372e0a95432c4cbf55ec9b136ba841faa0a6d99')

build() {
  msg2 "Creating build directories"
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build
  msg2 "Invoking cmake"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_STATIC_LIBS=TRUE ..
  msg2 "Building the framework"
  make
}

check() {
  cd $pkgname-$pkgver/build
  msg2 "Running unit tests"
  make test
}

package() {
  cd $pkgname-$pkgver/build
  msg2 "Packing all together"
  make DESTDIR="${pkgdir}" install
  msg2 "Add MIT License to package"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

