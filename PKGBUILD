# Maintainer: fabse

pkgname=bevy-cli-git
_pkgname=bevy_cli
pkgver=v0.6.0
pkgrel=2
pkgdesc="A Bevy CLI tool and linter."
arch=('aarch64' 'x86_64')
url="https://github.com/TheBevyFlock/bevy_cli"
license=("MIT")
makedepends=('cargo' 'git')
conflicts=("bevy-cli")
provides=("bevy")
source=('git+https://github.com/TheBevyFlock/bevy_cli')

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
	install -Dm755 "target/release/bevy" "$pkgdir/usr/bin/bevy"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

sha256sums=('SKIP')
