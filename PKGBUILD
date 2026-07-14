# Maintainer: severaltranscats (severaltranscats AT cleo DOT nyc)

pkgname=garlic-decompiler-gui
_pkgname=garlic-gui
pkgver=1.1.0
_pkgver="v$pkgver"
pkgrel=1
pkgdesc="GUI for the Garlic Decompiler, supporting APK, DEX, JAR, and CLASS (Android/Java) decompilation"
arch=('x86_64')
url="https://github.com/AgarwalKritik/garlic-gui"
license=('Apache-2.0')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
	"0001-remove-Wno-format-from-CXX-options.patch"
)
noextract=()
sha256sums=('7e7477e8a04de57005ee5bed0b07385ead962abf896b1c04e3975002944891a1'
            'a918bd102717e73803f47e704ac9e8eb806416fceea84b0cc965b7d6a5188a47')
validpgpkeys=()
prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i "$srcdir/0001-remove-Wno-format-from-CXX-options.patch"
}
build() {
	local cmake_options=(
		-B build
		-S $_pkgname-$pkgver
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D GARLIC_STATIC_QT=OFF
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}


package() {
	DESTDIR="$pkgdir" cmake --install build
}

