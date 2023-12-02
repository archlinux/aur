# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Seagate Technology LLC <opensea-build@seagate.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=openSeaChest
pkgname=openseachest
pkgver=23.12
pkgrel=1
pkgdesc="Seagate utilities useful for performing various operations on SATA, SAS, NVMe, and USB storage devices."
arch=('x86_64' 'aarch64')
url="https://github.com/Seagate/openSeaChest"
license=('MPL')
depends=()
makedepends=('meson' 'ninja')
optdepends=()
source=("$pkgname-$pkgver.tar.xz::${url}/releases/download/v${pkgver}/SourceCode_With_Submodules.tar.xz")
b2sums=('e083c80782c15cbe34d8b3892aa6de876a6eb4825fc9d214e86f2ca469764b63602f7b8e058e8b89def893ee297541e0feebea216eba4473061aedd8f68a0609')

build() {
	cd "${_pkgname}-v${pkgver}"
	meson setup --buildtype=release --prefix=/usr builddir
	ninja -C builddir
}

package() {
	cd "${_pkgname}-v${pkgver}"
	DESTDIR="${pkgdir}/" ninja -C builddir install
}
