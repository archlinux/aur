# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=prime_server
pkgver=0.6.7
pkgrel=1
pkgdesc="Non-blocking server API for distributed computing and SOA based on zeromq."
arch=('x86_64')
url="https://github.com/kevinkreiser/prime_server"
license=('custom')
depends=('curl' 'zeromq' 'czmq')
source=("https://github.com/kevinkreiser/prime_server/archive/$pkgver.tar.gz")
sha256sums=('30ccd40689e50f55ea01015331e14b7c0d7efdab5641e2831851545cb86ed6fb')

prepare() {
  cd "$pkgname-$pkgver"
  curl https://gist.githubusercontent.com/kevinkreiser/39f2e39273c625d96790/raw/c5b9b40d1e47cd190d78582993fd07e4478540af/logging.hpp > prime_server/logging.hpp
  curl https://gist.githubusercontent.com/kevinkreiser/ada902fb51a1ad1e5a27/raw/1c45352fa2c4e25a748cf1221b93a9aed4dbc34c/testing.hpp > test/testing/testing.hpp
}

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr LIBS="-lpthread"
  make all
}

check() {
  cd "$pkgname-$pkgver"
  make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set softtabstop=2 shiftwidth=2 expandtab:
