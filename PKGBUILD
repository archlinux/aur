# Maintainer: gardenapple <gardenapple@posteo.net>

pkgname=run-mailcap-rs-git
pkgver=r54.231621a
pkgrel=1
pkgdesc='run-mailcap replacement written in Rust'
arch=('any')
url="https://github.com/cglindkamp/run-mailcap-rs"
license=('ISC')
provides=('run-mailcap')
makedepends=('rust' 'git')
source=("$pkgname::git+https://github.com/cglindkamp/run-mailcap-rs")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"

	# gives an error when run with --locked
	RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --target-dir=target
}

check() {
	cd "$pkgname"

	RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
	cd "$pkgname"

	make COMPAT_LINKS=1 PREFIX="$pkgdir/usr/local" install	
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/run-mailcap-rs/"
}
