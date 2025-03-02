# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-core
arch=("x86_64")
depends=(
    "qt5-base" "kcoreaddons5" "qt5-quickcontrols2" "libxcursor"
    "qt5-x11extras" "qt5-tools" "qt5-graphicaleffects" "kwindowsystem5"
    "kidletime5" "polkit"  "polkit-qt5" "xorg-server-devel" "xf86-input-libinput"
    "xf86-input-synaptics"
)
makedepends=("extra-cmake-modules")
pkgdesc="The core components of LingmoOS, including system backend and session initiation."
pkgrel=1
pkgver=2.0.2
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fe40fa3bee8ba97a9e45004b2394b780237627f831ace3bcee099e71496e1f14')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}
package() {
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
