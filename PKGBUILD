# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=jellyfin-tui
pkgver=1.1.1
pkgrel=1
pkgdesc='A TUI client for Jellyfin'
arch=('x86_64')
url="https://github.com/dhonus/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('63b85f5e0f81c5ac0cdbf57fbbae37b8affdf38ca3955b0eede5bbaf91316f84')
depends=('openssl' 'mpv' 'gcc-libs' 'glibc')
makedepends=('cargo')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
