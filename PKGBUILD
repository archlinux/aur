# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-vault
pkgver=6.8.0
pkgrel=2
pkgdesc='SonicDE applet and services for creating encrypted vaults'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-vault'
license=('LGPL-2.0-or-later')
depends=(
	'fuse3'
	'glibc'
	'gocryptfs'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-activities'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-networkmanager'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-widgets-addons'
	'sonic-interface-libraries'
	'sonic-system-monitor-library'
	'sonic-workspace'
)
makedepends=('sonic-frameworks-cmake-modules')
optdepends=(
	'cryfs: to open old vaults created with CryFS'
	'encfs: to open old vaults created with EncFS'
)
provides=('plasma-vault')
conflicts=('plasma-vault')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ecd87ea9cf23ce40864dac300d558e9eeb66fa6dd6c4c37d8f147df6e781e882')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
