# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Seagate Technology LLC <opensea-build at seagate dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=openSeaChest
pkgname=openseachest
pkgver=24.08.1
pkgrel=1
pkgdesc='Seagate utilities useful for performing various operations on SATA, SAS, NVMe, and USB storage devices.'
arch=('x86_64' 'aarch64')
url='https://github.com/Seagate/openSeaChest'
license=('MPL-2.0')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.xz::${url}/releases/download/v${pkgver}/SourceCode_With_Submodules.tar.xz")
b2sums=('825768a6efe964edcaa5c59e378c4a502d4081cc148866ed3742cd3435198639683957fb2e84fc87a347a8e493e18200d4053cf2faa19b785d5e093bb1cc459a')

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
