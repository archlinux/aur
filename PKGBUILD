# Maintainer: Integral-Tech <integral@murena.io>

pkgname=roundedsbe
_pkgname=RoundedSBE
pkgver=1.0.3
pkgrel=2
pkgdesc="A fork of SierraBreezeEnhanced with integrated corner rounding effect CornersShader (reworked version of what used to be called LightlyShaders) and shared configuration."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/a-parhom/RoundedSBE/"
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules' 'kglobalaccel5' 'kde-dev-utils' 'knotifications5' 'kinit' 'kwin' 'qt5-declarative')
depends=('kcoreaddons5' 'libxcb' 'kwindowsystem5' 'kdecoration' 'kiconthemes5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/a-parhom/${_pkgname}/archive/refs/tags/V${pkgver}.tar.gz")
sha256sums=('f5214c65b49f14587ebdbcdbe2d358e37f41dd9f152559f157f9fa69775ff04a')

build() {
	cd "${_pkgname}-${pkgver}/"
	mkdir build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd "${_pkgname}-${pkgver}/build/"
	make DESTDIR=${pkgdir} install
}
