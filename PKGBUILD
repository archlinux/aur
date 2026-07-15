# Maintainer: dennisreyoonjiho <dennisreyoonjiho@gmail.com>
pkgname=easykiconverter
pkgver=3.1.12
pkgrel=1
pkgdesc="Convert LCSC and EasyEDA components to KiCad libraries"
arch=('x86_64' 'aarch64')
url="https://github.com/tangsangsimida/EasyKiConverter"
license=('GPL-3.0-only')
install=easykiconverter.install
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-shadertools'
    'zlib'
)
makedepends=(
    'cmake'
    'gcc'
    'git'
    'ninja'
    'qt6-tools'
)
optdepends=(
    'qt6-5compat: for some legacy QML components'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tangsangsimida/EasyKiConverter/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "EasyKiConverter-${pkgver}"

    cmake -B build -S . \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DEASYKICONVERTER_BUILD_TESTS=OFF \
        -DENABLE_SYMBOL_FOOTPRINT_DEBUG_EXPORT=ON

    cmake --build build --parallel $(nproc)
}

package() {
    cd "EasyKiConverter-${pkgver}"

    DESTDIR="${pkgdir}" cmake --install build
}
