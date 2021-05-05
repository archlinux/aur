# Maintainer: netthier <lp@netthier.net>
pkgname=owofetch-git
pkgdesc="Alternative to *fetch, uwuifies all stats."
pkgver=0.1.r4.g8780b1c
pkgrel=1
arch=('x86_64')
url="https://github.com/netthier/owofetch-rs"
license=('GPL3')
makedepends=('rust' 'cargo')
provides=('owofetch')
source=('git+https://github.com/netthier/owofetch-rs')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/owofetch-rs"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/owofetch-rs"
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "$srcdir/owofetch-rs"
	install -Dm 755 target/release/owofetch -t "${pkgdir}/usr/bin"
}
