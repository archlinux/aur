# Maintainer:  Florian Lindner <florian.lindner@xgm.de>
# Contributor: Jon Gjengset <jon@thesquareplanet.com>

pkgname=hotspot-git
pkgver=v1.2.0.r25.gc65a82f
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('any')
url="https://github.com/KDAB/hotspot"
license=('GPL2')
depends=('qt5-base>=5.6.0' 'libelf' 'elfutils' 'threadweaver' 'ki18n' 'kconfig' 'kio' 'kitemviews' 'kcoreaddons' 'kitemmodels' 'kconfigwidgets' 'solid')
makedepends=('git' 'cmake>=3.1.0' 'extra-cmake-modules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    git submodule update --init --recursive
}

build() {
    cd "${pkgname%-git}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="${pkgdir}/" install
}
