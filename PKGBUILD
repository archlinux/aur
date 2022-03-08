# Maintainer:  Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=1.3.0
pkgrel=3
pkgdesc="The Linux perf GUI for performance analysis"
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL2')
depends=('qt5-base>=5.6.0' 'libelf' 'elfutils' 'threadweaver' 'ki18n' 'kconfig' 'kio' 'kitemviews' 'kcoreaddons' 'kitemmodels' 'kconfigwidgets' 'solid' 'rustc-demangle>=0.1.18-2')
makedepends=('cmake>=3.1.0' 'extra-cmake-modules' 'desktop-file-utils')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/KDAB/hotspot/releases/download/v${pkgver}/hotspot-v${pkgver}.tar.gz")
sha1sums=('3fe86a97291a6c9cefc2d0a16e9b5379aa1a831c')

build() {
    cd "${pkgname}-v${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr \
            -DRUSTC_DEMANGLE_INCLUDE_DIR=/usr/include \
            -DRUSTC_DEMANGLE_LIBRARY=/usr/lib/librustc_demangle.so \
            -DBUILD_TESTING=off
    cmake --build .
}

package() {
    cd "${pkgname}-v${pkgver}"
    DESTDIR="${pkgdir}/" cmake --install .
    desktop-file-install hotspot.desktop --dir="${pkgdir}/usr/share/applications/"
}
