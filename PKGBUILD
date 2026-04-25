# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Seagate Technology LLC <opensea-build at seagate dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=openSeaChest
pkgname=openseachest
pkgver=26.03.1
pkgrel=1
pkgdesc='Seagate utilities useful for performing various operations on SATA, SAS, NVMe, and USB storage devices.'
arch=('x86_64' 'aarch64')
url='https://github.com/Seagate/openSeaChest'
license=('MPL-2.0')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.xz::${url}/releases/download/v${pkgver}/SourceCode_With_Submodules.tar.xz")
b2sums=('7d35f02b776bfd0b1962daf3876f79707ab210c59fce71d07cf0a5bf09b80bb158ed32d3fa6e41868895b477e5a022bcb0a181753777cf921d4caa94292c975b')

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
