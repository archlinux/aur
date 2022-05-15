# Maintainer: Eric Long <hackereric at outlook dot com>
# Contributor: Yukari Chiba <i@0x7f.cc>
pkgname=hive-server-git
pkgver=r2.5eba775
pkgrel=1
pkgdesc="Lua microservices framework."
arch=('x86_64')
url="https://github.com/hackerer1c/hive"
license=('MIT')
makedepends=('cargo')
commitid="5eba775be17e625d934573e1e4a0687005e078b1"
source=("$pkgname-$pkgver.tar.gz::https://github.com/hackerer1c/hive/archive/$commitid.tar.gz")
sha512sums=('cccaed703e62331858895d1a2bae81a4a57dc7cf9bb2af541f1807152a8f4cd36721ea93364839fcf4fd2b20d6ed4b7f4f4003f44cae8a2ba8771b6727a9464b')

build() {
  cd "hive-$commitid"

  cargo build --verbose --features mlua/vendored --release
}

check() {
  cd "hive-$commitid"

  cargo test --release --verbose
}

package() {
  cd "hive-$commitid"
  local OUT_DIR=$(<out_dir)

  install -Dm755 "target/release/hive-server" "$pkgdir/usr/bin/hive-server"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
