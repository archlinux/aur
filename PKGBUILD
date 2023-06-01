# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Seagate Technology LLC <opensea-build@seagate.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=openSeaChest
pkgname=openseachest
pkgver=23.03.1
pkgrel=1
pkgdesc="Seagate utilities useful for performing various operations on SATA, SAS, NVMe, and USB storage devices."
arch=('x86_64' 'aarch64')
url="https://github.com/Seagate/openSeaChest"
license=('MPL')
depends=()
makedepends=('meson' 'ninja')
optdepends=()
source=("$pkgname-$pkgver.tar.xz::${url}/releases/download/v${pkgver}/SourceCode_With_Submodules.tar.xz")
b2sums=('63a03a56068fd02bb37e9f3dfadfb70611aa245cdd85f47a492625685ff7ef34416e998b4a046898570ff29ccd46fb3a1e408ac04b76988b4b9834d33f57cb10')

build() {
	cd "${_pkgname}-v${pkgver}"
	meson --buildtype=release --prefix=/usr builddir
	ninja -C builddir
}

package() {
	cd "${_pkgname}-v${pkgver}"
	DESTDIR="${pkgdir}/" ninja -C builddir install
}
