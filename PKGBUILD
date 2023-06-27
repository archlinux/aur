# Maintainer: Anarcoco <archlinux.dn4qx@slmail.me>
pkgname=sudo-rs-git
pkgver=r1148.d4abd98
pkgrel=1
pkgdesc="A memory safe implementation of sudo and su. "
arch=('any')
url="https://github.com/memorysafety/sudo-rs"
license=('Apache 2.0', 'MIT')
makedepends=('rust' 'cargo' 'clang' 'git')
provides=(sudo-rs) # Will replace with "sudo" when sudo-rs becomes stable.
source=("git+https://github.com/memorysafety/sudo-rs")
install=warning.install
sha256sums=(SKIP)
pkgver() {
	cd "$srcdir/sudo-rs"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd $srcdir/sudo-rs
	cargo build --release
}
package() {
	cd $srcdir/sudo-rs
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/sudo-rs/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/sudo-rs/LICENSE-APACHE"
	install -Dm4755 target/release/sudo "$pkgdir/usr/bin/sudo-rs" # Will replace with "sudo" when sudo-rs becomes stable.
}
