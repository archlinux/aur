pkgname=netinfo-ffi
pkgver=0.3.0
pkgrel=1
pkgdesc="C wrapper for netinfo, which groups network usage by process"
arch=('i686' 'x86_64')
url="https://github.com/ChangSpivey/netinfo-ffi"
license=('AGPL-3.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://github.com/ChangSpivey/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('9f553eed7d1a113bb0c68e34ed5b0028c8b74648d1c8109895a63b58c47aaa49dd2fe8bfee8416dc7dfef9872ac3ba6d9abcd9cac6a900284dd5b3f49b7c1750')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 "target/release/libnetinfo.so" "$pkgdir/usr/lib/libnetinfo.so"
  install -Dm644 "src/netinfo.h" "$pkgdir/usr/include/netinfo.h"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
