# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=sonic-partition-manager
pkgver=26.08.2
pkgrel=1
pkgdesc='A SonicDE utility that allows you to manage disks, partitions, and file systems'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-partition-manager'
license=('GPL-2.0-or-later')
depends=(
	'glibc'
	'kpmcore'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
	'sonic-polkit'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('partitionmanager')
conflicts=('partitionmanager')
groups=(
	'sonicde-applications'
	'sonicde-system'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bd342fdf5277b91160f297242eb1eb3bdfbfafe04cc2450f7c9f91ad9bd1c100')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
