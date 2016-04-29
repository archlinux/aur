# Maintainer: Jingbei Li <i@jingbei.li>

pkgname=libwebsockets
pkgver=1.7.0
pkgrel=1
pkgdesc="A lightweight pure C library built to use minimal CPU and memory resources, and provide fast throughput in both directions."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://libwebsockets.org"
depends=('openssl' 'make')
makedepends=('cmake')
license=('LGPL')
source=("https://github.com/warmcat/libwebsockets/archive/v$pkgver.tar.gz")
md5sums=('b4458f84d2b1b46bfb331354fa072450')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install

  cd ..
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd "$pkgdir/usr"
}

