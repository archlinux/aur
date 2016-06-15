# Maintainer: PureTryOut
pkgname=horizon-launcher-git
pkgver=r822.e4157b9
pkgrel=1
epoch=
pkgdesc="A customizable, cross-platform and open-source launcher for launching all your games on Steam and other gaming services"
arch=('x86_64')
url="http://launchhorizon.com"
license=('MIT')
groups=()
depends=('qt5-base' 'qt5-tools' 'qt5-webkit' 'qt5-webengine')
makedepends=('git' 'cmake' 'make' 'boost')
checkdepends=()
optdepends=()
provides=('horizon-launcher')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('horizon-launcher-git::git+https://github.com/horizonlauncher/client.git'
	'horizon-launcher.desktop')
noextract=()
sha256sums=('SKIP'
	'c9046f7a6d678e0565e36458ca003c3757ac861e4f9cae8ff0989755cbcb5543')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	
	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build

	cmake ..
	make $MAKEFLAGS
}


package() {
	cd "$pkgname"

	# The application
	install -Dm755 build/HorizonLauncher "$pkgdir/usr/bin/horizon-launcher"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

	# .desktop file and icon
	install -Dm644 "$srcdir/horizon-launcher.desktop" "$pkgdir"/usr/share/applications/horizon-launcher.desktop	
	install -Dm644 res/icon/Horizon.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/horizon.svg
}
