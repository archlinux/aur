# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-kwin-plugins
arch=("x86_64")
depends=(
    'kwin' 'qt5-base' 'qt5-declarative' 'kconfig'
    'kdecoration5' 'kguiaddons' 'kcoreaddons' 'kconfigwidgets'
    'kwindowsystem' 'kwayland'
)
makedepends=('extra-cmake-modules' 'plasma-framework5' 'kdecoration5')
pkgdesc="KWin plugin for LingmoOS"
pkgrel=1
pkgver=1.2.4

url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('564236b7f8292b606552a34eb5d483258f9e13d683cb9c5fc047c042b0333791')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}/build"
    cmake -DCMAKE_PREFIX_PATH=/usr/lib/cmake/plasma5/KDecoration2 -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}
package() {
    cd ${pkgname}-${pkgver//_/-}/build
    make DESTDIR="${pkgdir}" install
}
