# Maintainer: Eric Long <hackereric at outlook dot com>
# Contributor: Yukari Chiba <i@0x7f.cc>
pkgname=hive-server-git
pkgver=r1.8bf6530
pkgrel=1
pkgdesc="Lua microservices framework."
arch=('x86_64')
url="https://github.com/hackerer1c/hive"
license=('MIT')
makedepends=('cargo')
commitid="8bf65304ab5cae499f6fa0a647a4565f6672aa26"
source=("$pkgname-$pkgver.tar.gz::https://github.com/hackerer1c/hive/archive/$commitid.tar.gz")
sha512sums=('2c5453fbc860d7389adbbbf45c0ecdc09f1e92eaa9880027dd6f8b2330c056c88767ab64b34f854b3a42b55cd3d8571b40de05fa0e426523a48e3159b4b20114')

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
