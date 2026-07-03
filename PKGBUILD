# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=flyline
pkgver=1.2.3
pkgrel=1
pkgdesc="A Bash plugin to replace readline for a modern line editing experience"
arch=('x86_64')
url="https://github.com/HalFrgrd/flyline"
license=('MIT' 'GPL-3.0-only')
depends=('bash' 'gcc-libs')
makedepends=('cargo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('986eedec24acdce9ccefdec50f92844a42def5bfb904385e71287f7a56755bb8')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/lib$pkgname.so" "$pkgdir/usr/lib/bash/lib$pkgname.so"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT LICENSE-GPLv3 -t "$pkgdir/usr/share/licenses/$pkgname"
}
