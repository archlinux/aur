# Maintainer: fabse

pkgname=iced-comet-git
_pkgname=comet
pkgver=v0.14.0
pkgrel=1
pkgdesc="Your favorite tool for inspecting and debugging iced applications. Built with iced!"
arch=('aarch64' 'x86_64')
url="https://github.com/iced-rs/comet"
license=("MIT")
makedepends=('cargo' 'git')
conflicts=("comet")
provides=("comet")
source=('git+https://github.com/iced-rs/comet')

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
	install -Dm755 "target/release/comet" "$pkgdir/usr/bin/comet"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('SKIP')
