# Maintainer: fabse

pkgname=niri-scratchpad-rs-git
_pkgname=niri-scratchpad-rs
pkgver=v2.1
pkgrel=1
pkgdesc="Dynamic & Static Scratchpad Management for Niri"
arch=('aarch64' 'x86_64')
url="https://github.com/argosnothing/niri-scratchpad-rs"
license=("GPL-3.0-or-later")
makedepends=('cargo' 'git')
conflicts=("niri-scratchpad" "niri-scratchpad-rs")
provides=("niri-scratchpad")
source=('git+https://github.com/argosnothing/niri-scratchpad-rs')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/niri-scratchpad" "$pkgdir/usr/bin/niri-scratchpad"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('SKIP')
