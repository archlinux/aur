# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Seagate Technology LLC <opensea-build at seagate dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=openSeaChest
pkgname=openseachest
pkgver=25.05.1
pkgrel=1
pkgdesc='Seagate utilities useful for performing various operations on SATA, SAS, NVMe, and USB storage devices.'
arch=('x86_64' 'aarch64')
url='https://github.com/Seagate/openSeaChest'
license=('MPL-2.0')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.xz::${url}/releases/download/v${pkgver}/SourceCode_With_Submodules.tar.xz")
b2sums=('9f13dd3c7c4e256c897073ea58e7b91d581183cc84e21bc18b9b7a4d5fbacb2ceddc7213dc4ea7f0a4772aef0f30df7516391c9fa8c194dc97527d258eda3f67')

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
