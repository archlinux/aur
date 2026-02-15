# Maintainer: BitYoungjae <bityoungjae@gmail.com>
pkgname=chalkak
pkgver=0.2.0
pkgrel=1
pkgdesc="Hyprland screenshot preview and editor utility"
arch=('x86_64' 'aarch64')
url="https://github.com/bityoungjae/chalkak"
_srcname="ChalKak"
license=('MIT' 'Apache-2.0')
depends=('gtk4' 'hyprland' 'grim' 'slurp' 'wl-clipboard')
makedepends=('rust' 'cargo' 'pkgconf' 'gtk4')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9381ca12feb3c398f335f8afb33681ec2911a05249e244ece440afd65972d990')

build() {
  cd "$_srcname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$_srcname-$pkgver"

  # Install binary
  install -Dm755 "target/release/chalkak" "$pkgdir/usr/bin/chalkak"

  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md" || true
  install -Dm644 "README.ko.md" "$pkgdir/usr/share/doc/$pkgname/README.ko.md" || true

  # Install dual-license texts
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" || true
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" || true
}
