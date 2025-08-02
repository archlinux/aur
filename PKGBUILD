# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Seagate Technology LLC <opensea-build at seagate dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=openSeaChest
pkgname=openseachest
pkgver=25.05.2
pkgrel=1
pkgdesc='Seagate utilities useful for performing various operations on SATA, SAS, NVMe, and USB storage devices.'
arch=('x86_64' 'aarch64')
url='https://github.com/Seagate/openSeaChest'
license=('MPL-2.0')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.xz::${url}/releases/download/v${pkgver}/SourceCode_With_Submodules.tar.xz")
b2sums=('d7d2bc346c79ec93fb44fa6775acc2c6af928a17ee0d77c1f433d46f3b5f708df54757cafbecb622e76cb5b7be072837dd84a39b82504050da9842cf0bea7e48')

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
