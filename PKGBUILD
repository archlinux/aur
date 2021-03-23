# Maintainer: grtcdr <ba.tahaaziz@gmail.com>

pkgname=macchina
pkgver=0.6.1
pkgrel=1
pkgdesc="Basic system information fetcher, written in Rust"

arch=('x86_64')
url="https://github.com/grtcdr/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	cargo build --release
}

check() {
	cd "$pkgname"
	cargo test --release
}

package() {
	cd "$pkgname"
	targetdir=${CARGO_TARGET_DIR:-target}
	install -Dm755 "$targetdir/release/macchina" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
