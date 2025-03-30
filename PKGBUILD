# Maintainer: HurricanePootis <hurricanepootis@protonamil.com
pkgname=krunner-symbols-git
pkgver=1.1.0.r35.g844195b
pkgrel=3
pkgdesc=" A lightweight KRunner plugin (Plasma 6) to retrieve unicode symbols, or any other string, based on a corresponding keyword."
arch=('x86_64')
url="https://github.com/domschrei/krunner-symbols"
license=('GPL-3.0-only')
depends=('krunner' 'qt6-5compat' 'glibc' 'kcoreaddons' 'qt6-base' 'gcc-libs' 'ki18n' 'kconfig' 'kservice' 'krunner' 'ktextwidgets')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'libplasma' 'ninja')
provides=('krunner-symbols')
conflicts=('krunner-symbols')
source=("git+$url.git#branch=plasma6")
sha256sums=('SKIP')
validpgpkeys=()

pkgver(){
	cd "$srcdir/${pkgname::-4}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname::-4} \
	-G Ninja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DLOCATION_PLUGIN=/usr/lib/qt6/plugins \
	-DLOCATION_CONFIG="share/config" \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
