# Maintainer:  Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=1.4.1
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL2')
depends=('qt5-base>=5.15.0' 'libelf' 'elfutils' 'threadweaver' 'kddockwidgets' 'ki18n' 'kconfig' 'kio' 'kitemviews' 'kcoreaddons' 'kitemmodels' 'kconfigwidgets' 'kparts' 'solid' 'rustc-demangle>=0.1.18-2')
makedepends=('cmake>=3.16.0' 'extra-cmake-modules' 'desktop-file-utils')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/KDAB/hotspot/releases/download/v${pkgver}/hotspot-v${pkgver}.tar.gz")
sha1sums=('242d8300225535fe6b61ecb79f2ba7cc4c9912f2')

build() {
    cd "${pkgname}-v${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr \
            -DBUILD_TESTING=off
    cmake --build .
}

package() {
    cd "${pkgname}-v${pkgver}"
    DESTDIR="${pkgdir}/" cmake --install .
    desktop-file-install com.kdab.hotspot.desktop --dir="${pkgdir}/usr/share/applications/"
}
