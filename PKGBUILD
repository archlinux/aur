# Maintainer: lmartinez-mirror
# Contributor: Pierre Dommerc <dommerc dot pierre at geemail dot com>
pkgname=bato
pkgver=0.1.3
pkgrel=1
pkgdesc="Small program to send battery notifications"
arch=('x86_64')
url="https://github.com/doums/bato"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
depends=('libnotify')
makedepends=('cmake' 'rust')
sha256sums=('eff35fb2e51e41fb91cced7b9ca2c2a092bbd43fa102a157c8c148e538f25fd4')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/version = \"0.1.2\"/version = \"$pkgver\"/" Cargo.lock
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/bato -t "$pkgdir/usr/bin"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
