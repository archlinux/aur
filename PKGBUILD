# Maintainer: Benjamin Hennion <benjamin dot hennion at wanadoo dot fr>
pkgname=plasma-settings-git
pkgver=v21.07.r9.ge9abd2c
pkgrel=1
pkgdesc="Settings application for Plasma Mobile"
arch=('any')
url="https://www.plasma-mobile.org/"
license=('GPL2')
groups=()
depends=('kio' 
	'ki18n' 
	'plasma-workspace'
	'kdeclarative' 
	'plasma-framework' 
	'kcmutils' 
	'knotifications'
	'kwindowsystem'
	)

makedepends=('cmake' 'extra-cmake-modules' 'git') 
provides=('plasma-settings')
conflicts=('plasma-settings')
replaces=()
backup=()
options=()
install=
source=('git+https://invent.kde.org/plasma-mobile/plasma-settings.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/plasma-settings"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/plasma-settings"
	cmake -B build \
	      -DCMAKE_INSTALL_PREFIX="/usr" 

	cmake --build build
}

package() {
	cd "$srcdir/plasma-settings/build"
	make DESTDIR="$pkgdir/" install
}
