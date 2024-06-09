# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname_base=seccomp-filtered
pkgname=${_pkgname_base}-run
pkgver=1.0.0
pkgrel=2
pkgdesc='Run other program with seccomp filters.'
url="https://gitlab.com/patlefort/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cargo')
arch=('x86_64' 'aarch64')
source=("https://gitlab.com/patlefort/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2c9d685bbdc57a3a3b8c4035fad42af5df6a2ec8364cdbf1601fdf7a18cfdf9f')

_srcdir="${pkgname}-v${pkgver}"

build() {
	cd "${_srcdir}"

	cargo build --release --target-dir="${srcdir}/build"
}

package() {
	install -Dm755 "build/release/${_pkgname_base}-run" -t "${pkgdir}/usr/bin"
	install -Dm755 "build/release/${_pkgname_base}-gen" -t "${pkgdir}/usr/bin"
}
