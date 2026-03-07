# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Seagate Technology LLC <opensea-build at seagate dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=openSeaChest
pkgname=openseachest
pkgver=26.03.0
pkgrel=1
pkgdesc='Seagate utilities useful for performing various operations on SATA, SAS, NVMe, and USB storage devices.'
arch=('x86_64' 'aarch64')
url='https://github.com/Seagate/openSeaChest'
license=('MPL-2.0')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.xz::${url}/releases/download/v${pkgver}/SourceCode_With_Submodules.tar.xz")
b2sums=('6bc2c4f1064ca77d0357c226f907abee31365f70f7060d0bf82f919ac86d26dcf6f5a657870485b2475f579fc910533ffb5c9d91ef7f2959aae0388b5b70f990')

build() {
	cd "${_pkgname}-v${pkgver}"
	meson setup --buildtype=release --prefix=/usr builddir
	ninja -C builddir
}

package() {
	cd "${_pkgname}-v${pkgver}"
	DESTDIR="${pkgdir}/" ninja -C builddir install
	install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
