# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=proxygen
pkgver=2019.03.25.00
pkgrel=2
pkgdesc="A collection of C++ HTTP libraries including an easy to use HTTP server."
arch=('x86_64')
url="https://github.com/facebook/proxygen"
license=('BSD')
depends=('folly' 'wangle' 'zstd' 'fizz' 'boost' 'openssl' 'zlib' 'libcap')
makedepends=('cmake' 'python' 'gperf' 'gperftools')
conflicts=('proxygen-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('cf849f27cd7780fbfa8ae7dce3518d15b13650da2ba8ca3c16cc6613f7d423a5')

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
