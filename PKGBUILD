# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=proxygen
pkgver=2019.04.01.00
pkgrel=1
pkgdesc="A collection of C++ HTTP libraries including an easy to use HTTP server."
arch=('x86_64')
url="https://github.com/facebook/proxygen"
license=('BSD')
depends=('folly' 'wangle' 'zstd' 'fizz' 'boost' 'openssl' 'zlib' 'libcap')
makedepends=('cmake' 'python' 'gperf' 'gperftools')
conflicts=('proxygen-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d377d23e8fd3621b40fab7143013d8aac142f5d295320456e78b0ab7b1824839')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -B _build .
  cmake --build _build
}

check() {
  cd "$pkgname-$pkgver"
  # cmake --build _build --target test
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build _build --target install -- DESTDIR="$pkgdir/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname/external/http_parser/http_parser.h" \
                 "$pkgdir/usr/include/$pkgname/external/http_parser/http_parser.h"
}
