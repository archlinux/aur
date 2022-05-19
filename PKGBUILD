# Maintainer: Eric Long <hackereric at outlook dot com>
# Contributor: Yukari Chiba <i@0x7f.cc>
pkgname=hive-server-git
pkgver=r3.fe436c1
pkgrel=1
pkgdesc="Lua microservices framework."
arch=('x86_64')
url="https://github.com/hackerer1c/hive"
license=('MIT')
makedepends=('cargo')
commitid="fe436c16a3e5b2e45559e5e948dabab1446a5b3e"
source=("$pkgname-$pkgver.tar.gz::https://github.com/hackerer1c/hive/archive/$commitid.tar.gz")
sha512sums=('0c26504cdf5510fc073509b82339ecf008c4f31ca5dd93b1ff0c4ef81fc30f05d88b295cd5c650575635e5a85795414ae8dd444501b934f30fc075c8b5ede705')

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
