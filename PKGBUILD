# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Jingbei Li <i@jingbei.li>

pkgname=libwebsockets15
pkgver=1.5.1
pkgrel=2
pkgdesc="A lightweight pure C library built to use minimal CPU and memory resources, and provide fast throughput in both directions."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://libwebsockets.org"
depends=('openssl' 'make')
makedepends=('cmake')
conflicts=('libwebsockets')
license=('LGPL')
source=("https://github.com/warmcat/libwebsockets/archive/v$pkgver.tar.gz")
md5sums=('c66a7437e4d05f1f073630837a2142e9')
_pkgname=${pkgname/15/}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install

  cd ..
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd "$pkgdir/usr"
}

