# Maintainer: PureTryOut
pkgname=horizon-launcher
pkgver=r739.ad2d3c6
pkgrel=1
epoch=
pkgdesc="A customizable, cross-platform and open-source launcher for launching all your games on Steam and other gaming services"
arch=('x86_64')
url="http://launchhorizon.com"
license=('MIT')
groups=()
depends=('qt5-base' 'qt5-tools' 'qt5-webkit')
makedepends=('git' 'cmake' 'make')
checkdepends=()
optdepends=()
provides=('horizon-launcher')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('horizon-launcher::git+https://github.com/horizonlauncher/client.git')
noextract=()
md5sums=('SKIP')
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
	make -j$(expr $(nproc) + 1) -l$(nproc)
}


package() {
	cd "$pkgname"
	install -Dm755 build/HorizonLauncher "$pkgdir/usr/bin/horizon-launcher"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

	cd .. && rm -rf build
}
