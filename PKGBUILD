# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=xl-view
pkgver=0.2.0
pkgrel=1
pkgdesc='Minimalist HDR image viewer optimized for large images.'
url="https://github.com/andrinbr/${pkgname}"
license=('GPL-3.0-only')
depends=('libgcc' 'glibc')
makedepends=('rust' 'cargo')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1bce9be4b2507375529da9e7b55e205f8cfc3215f1b58143a1f03cd1fea0d1f9')

_srcdir="${pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"

	cargo build --release --target-dir="${srcdir}/build"
}

package() {
	install -Dm755 "build/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${_srcdir}/assets/icons/io.github.andrinbr.xl_view.svg" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${_srcdir}/packaging/linux/io.github.andrinbr.xl_view.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${_srcdir}/packaging/linux/io.github.andrinbr.xl_view.appdata.xml" -t "${pkgdir}/usr/mime/packages"
}
