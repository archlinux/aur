# Maintainer: Integral-Tech <integral@murena.io>

pkgname=roundedsbe-git
_pkgname=RoundedSBE
pkgver=1.0.3.r30.g4f71ab0
pkgrel=1
pkgdesc="A fork of SierraBreezeEnhanced with integrated corner rounding effect CornersShader (reworked version of what used to be called LightlyShaders) and shared configuration."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/a-parhom/RoundedSBE"
license=('GPL3')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kglobalaccel' 'kde-dev-utils' 'knotifications' 'kinit' 'kwin' 'qt5-declarative')
depends=('kcoreaddons' 'libxcb' 'kwindowsystem' 'kdecoration' 'kiconthemes' 'kwin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}/"
	git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/V//'
}

build() {
	cd "${_pkgname}/"
	mkdir build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd "${_pkgname}/build/"
	make DESTDIR=${pkgdir} install
}
