# Maintainer: bahdotsh <appu.yess@gmail.com>
# Contributor: 9M2PJU <9m2pju@gmail.com>
pkgname=hopchat
pkgver=0.1.0
pkgrel=1
pkgdesc="Offline, end-to-end encrypted terminal chat for your local network. No server, no internet, no accounts."
arch=('x86_64' 'aarch64')
url="https://github.com/bahdotsh/hopchat"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bahdotsh/hopchat/archive/refs/tags/v$pkgver.tar.gz")
# NOTE: filled in on the first upstream release (v0.1.0 tag does not exist yet).
# Update with: updpkgsums (or makepkg -g) after the tag is pushed.
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo test --locked --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/hopchat" "$pkgdir/usr/bin/hopchat"
  install -Dm644 packaging/hopchat.1 "$pkgdir/usr/share/man/man1/hopchat.1"
  install -Dm644 packaging/hopchat.desktop "$pkgdir/usr/share/applications/hopchat.desktop"
  install -Dm644 packaging/hopchat.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hopchat.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
