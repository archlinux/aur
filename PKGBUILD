# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=xl-view
pkgver=0.5.0
pkgrel=1
pkgdesc='Minimalist HDR image viewer optimized for large images.'
url="https://github.com/andrinbr/${pkgname}"
license=('GPL-3.0-only')
depends=('libgcc' 'glibc')
makedepends=('rust' 'cargo')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cdf5fc3d2dc2f5074eb0a72df983d72caf08d177525437cf092aea4b154d19ef')

_srcdir="${pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"

	cargo build --release --target-dir="${srcdir}/build"
}

package() {
	install -Dm755 "build/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${_srcdir}/assets/icons/io.github.andrinbr.xl_view.svg" "${pkgdir}/usr/share/pixmaps/io.github.andrinbr.xl-view.svg"
	install -Dm644 "${_srcdir}/packaging/linux/io.github.andrinbr.xl-view.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${_srcdir}/packaging/linux/io.github.andrinbr.xl-view.metainfo.xml" -t "${pkgdir}/usr/mime/packages"
}
