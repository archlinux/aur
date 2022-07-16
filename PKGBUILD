# Maintainer: crapStone <crapstone01@gmail.com>

pkgname=lamp
pkgver=0.3.1
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A Linux backlight utility written in Rust"
url="https://codeberg.org/crapStone/lamp"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ad03fb78aaf4bdc1127839870be7d8dc5c21bc8aabe8274165d6d0f9c8af1337')

prepare() {
	cd "$pkgname"

	cargo fetch --locked
}

build() {
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package () {
	cd "$pkgname"

	install -Dm0755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm0644 target/completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm0644 target/completions/$pkgname.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm0644 target/completions/_$pkgname "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
