# Maintainer: Atif Chowdhury <iftakhar.awal@gmail.com>
pkgname=xcolor-git
_pkgname=xcolor
pkgver=0.5.0.r0.geb7a57e
pkgrel=2
pkgdesc="Lightweight color picker for X11"
arch=(x86_64)
url="https://github.com/Soft/xcolor"
license=(MIT)
depends=("libxcb")
makedepends=("rust" "cargo" "python")
conflicts=("xcolor")
provides=("xcolor")
source=("git+https://github.com/Soft/xcolor.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	cargo build --release
}

package() {
	cd "${_pkgname}"
	install -Dm755 target/release/xcolor "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 man/xcolor.1 "${pkgdir}/usr/share/man/man1/xcolor.1"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
