# Maintainer: Atif Chowdhury <iftakhar.awal@gmail.com>
pkgname=xcolor-git
_pkgname=xcolor
pkgver=0.5.0.102.geb7a57e
pkgrel=1
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
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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
