# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-io-extras
pkgver=26.08.2
pkgrel=1
pkgdesc='Additional components to increase the functionality of sonic-frameworks-io'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-io-extras'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'kdsoap-qt6'
	'kdsoap-ws-discovery-client'
	'libgcc'
	'libimobiledevice'
	'libmtp'
	'libplist'
	'libproxy'
	'libssh'
	'libstdc++'
	'libtirpc'
	'libxcursor'
	'qt6-base'
	'qt6-svg'
	'ripgrep-all'
	'sh'
	'smbclient'
	'sonic-activities'
	'sonic-exiv2-library'
	'sonic-frameworks-app-info'
	'sonic-frameworks-archive'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-notifications'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-syntax-highlighting'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-zeroconf'
)
makedepends=(
	'gperf'
	'libappimage'
	'openexr'
	'qcoro'
	'sonic-activities-stats'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
	'taglib'
)
optdepends=(
	'libappimage: AppImage thumbnails'
	'openexr: EXR format thumbnails'
	'perl: info kioslave'
	'qt6-imageformats: thumbnails for additional image formats'
	'sonic-activities-stats: recently used kioslave'
	'sonic-frameworks-image-formats: thumbnails for additional image formats'
	'taglib: audio file thumbnails'
)
provides=('kio-extras')
conflicts=('kio-extras')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e513ed748d190c2493fdf43dd6cde4934cc458d1fa17b9eb26ac5b26d039adf2')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DLIBAPPIMAGE_LIBRARIES=libappimage.so \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
