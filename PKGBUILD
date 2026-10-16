# Maintainer: bjl32 <bjl32@users.noreply.github.com>
pkgname=why
pkgver=0.2.0
pkgrel=1
pkgdesc='A Linux troubleshooter that explains why a program does not work'
arch=('x86_64' 'aarch64')
url='https://github.com/bjl32/why'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Release preparation: replace SKIP with `updpkgsums` once the v$pkgver
# archive exists, then regenerate .SRCINFO before publishing to the AUR.
sha256sums=('fa5482032765d99e7ecc0d5bab5e03d8aff469874b4bd2dfbcdcec92d7a31576')

build() {
  cd "$pkgname-$pkgver"
  # No dependencies, so the build is fully hermetic.
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
