# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-gtk-theme-bridge
pkgver=6.8.0
pkgrel=1
pkgdesc='Syncs SonicDE settings to GTK applications'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-gtk-theme-bridge'
license=('LGPL-2.0-or-later')
depends=(
	'glib2'
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-svg'
	'sh'
	'sonic-decoration'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-windowsystem'
	'xdg-desktop-portal-gtk'
	'xsettingsd'
)
makedepends=(
	'gtk3'
	'sassc'
	'sonic-frameworks-cmake-modules'
)
optdepends=('gtk3: GTK3 apps support')
provides=('kde-gtk-config')
conflicts=('kde-gtk-config')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2d6cdda4940a2995377fedac4db23cbbf667541e527dc2ebd1b88167289a12aa')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
