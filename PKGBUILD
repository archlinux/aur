# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=prime_server
pkgver=0.6.4
pkgrel=1
pkgdesc="Non-blocking server API for distributed computing and SOA based on zeromq."
arch=('x86_64')
url="https://github.com/kevinkreiser/prime_server"
license=('custom')
depends=('curl' 'czmq')
source=("https://github.com/kevinkreiser/prime_server/archive/$pkgver.tar.gz")
sha256sums=('af2e679f97b34cb8750c5c3bea3cef932d10cfda9acbb3374c7814c2cf78d9c9')

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
