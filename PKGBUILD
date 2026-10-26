# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=sonic-oxygen
pkgname=(
	'sonic-oxygen'
	'sonic-oxygen-cursors'
)
pkgdesc='SonicDE Oxygen style'
pkgver=6.8.0
pkgrel=1
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-oxygen'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libxcb'
	'qt6-base'
	'qt6-declarative'
	'sonic-decoration'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-qt-integration'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-oxygen-icons'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-interface-libraries'
)
provides=('oxygen')
conflicts=('oxygen')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e90f4020e7247d2d12774b795fe6cdcd0ee6c58ec44745f54fa950da26a140b7')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF \
		-DBUILD_QT5=OFF
	cmake --build build
}

package_sonic-oxygen() {
	depends+=(sonic-oxygen-cursors)

	DESTDIR="$pkgdir" cmake --install build
	# Split cursors
	rm -r "$pkgdir"/usr/share/icons/{KDE_Classic,Oxygen*}
}

package_sonic-oxygen-cursors() {
	pkgdesc='SonicDE Oxygen cursors'
	depends=()
	optdepends=()
	provides=('oxygen-cursors')
	conflicts=('oxygen-cursors')

	DESTDIR="$pkgdir" cmake --install build/cursors
}
