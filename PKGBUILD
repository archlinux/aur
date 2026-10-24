# Maintainer: bjl32 <bjl32@users.noreply.github.com>
pkgname=why
pkgver=0.2.1
pkgrel=1
pkgdesc='A Linux troubleshooter that explains why a program does not work'
arch=('x86_64' 'aarch64')
url='https://github.com/bjl32/why'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1edc8fe4c839f467d6978ecfc47fca89819c5ff78e2af76a2ac1318c0373f0f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --offline
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --offline
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 TODO "$pkgdir/usr/share/doc/$pkgname/TODO"
}
