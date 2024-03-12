# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=ra-multiplex-git
pkgver=v0.2.2.r55.g1db8eb0
pkgrel=1
pkgdesc="Share one rust-analyzer server instance between multiple LSP clients to save resources"
arch=('any')
url="https://github.com/pr2502/ra-multiplex"
license=('MIT')
makedepends=('rustup')
provides=('ra-multiplex')
source=("${pkgname}::git+${url}.git")
depends=('rust-analyzer')
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${pkgname}
	cargo build --release
}

package() {
	cd "${pkgname}"
	install -D -m755 "target/release/ra-multiplex" "${pkgdir}/usr/local/bin/ra-multiplex"
	install -D -m644 ra-mux.service "${pkgdir}/usr/lib/systemd/user/ra-mux.service"
}
