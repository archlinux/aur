# Maintainer:  Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=1.2.0
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('any')
url="https://github.com/KDAB/hotspot"
license=('GPL2')
depends=('qt5-base>=5.6.0' 'libelf' 'elfutils' 'threadweaver' 'ki18n' 'kconfig' 'kio' 'kitemviews' 'kcoreaddons' 'kitemmodels' 'kconfigwidgets' 'solid')
makedepends=('cmake>=3.1.0' 'extra-cmake-modules')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/KDAB/hotspot/releases/download/v${pkgver}/hotspot-v${pkgver}.tar.gz")
sha1sums=('52a946fa5e6661e607a03b8faf32abe5b201c62c')

build() {
    cd "${pkgname}-v${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}/" install
    mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
}
