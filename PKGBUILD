# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-io
pkgver=6.31.0
pkgrel=1
pkgdesc='Resource and network access abstraction'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-io'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'acl'
	'glibc'
	'libstdc++'
	'libxml2'
	'libxslt'
	'qt6-base'
	'sonic-frameworks-app-info'
	'sonic-frameworks-archive'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-bookmarks'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-views'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-keyring'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'util-linux-libs'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=(
	'audiocd-kio: for accessing audio CDs'
	'sonic-daemon: proxy management and cookie storage'
	'sonic-frameworks-doctools: for the help kioslave'
	'sonic-frameworks-io-extras: extra protocols support (sftp, fish and more'
	'sonic-frameworks-io-fuse: to mount remote filesystems via FUSE'
	'switcheroo-control: hybrid GPU support'
)
provides=('kio')
conflicts=('kio')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4e53ba41df81b3d85b3dd362b35ec011d7958021c16231b3e2877a0fa4b2f2a2')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
