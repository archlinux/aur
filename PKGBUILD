# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname_base=seccomp-filtered
pkgname=${_pkgname_base}-run
pkgver=1.1.0
pkgrel=1
pkgdesc='Run other program with seccomp filters.'
url="https://gitlab.com/patlefort/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cargo')
arch=('x86_64' 'aarch64')
source=("https://gitlab.com/patlefort/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f72dce2bf0b9cbe40fa74a88a4289d8e73bc41c828080fd0b7513414070ca9e5')

_srcdir="${pkgname}-v${pkgver}"

build() {
	cd "${_srcdir}"

	cargo build --release --target-dir="${srcdir}/build"
}

package() {
	install -Dm755 "build/release/${_pkgname_base}-run" -t "${pkgdir}/usr/bin"
	install -Dm755 "build/release/${_pkgname_base}-gen" -t "${pkgdir}/usr/bin"
}
