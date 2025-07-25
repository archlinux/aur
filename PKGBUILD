# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
pkgname="pacpak-git"
_pkgname=${pkgname%-git}
pkgver=0.1.0.r1.g7bf9fbd
pkgrel=1
pkgdesc="manage your flatpaks with this pacman wrapper"
arch=("x86_64")
url="https://github.com/egnrse/pacpak"
license=("MIT")
depends=("flatpak")
makedepends=("git" "cargo")
optdepends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd "${pkgname}"
    export CARGO_TARGET_DIR=target
    cargo build --locked --release
}
package() {
	cd "${pkgname}"
	install -Dm755 "target/release/pacpak" "${pkgdir}/usr/bin/pacpak"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "./pacpak.1.man" "${pkgdir}/usr/share/man/man1/pacpak.1"
}
