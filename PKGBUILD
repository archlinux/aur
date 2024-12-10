# Maintainer: taotieren <admin@taotieren.com>

pkgname=qucs-rflayout
_name=Qucs-RFlayout
pkgver=2.1.2
pkgrel=1
epoch=
pkgdesc="Export Qucs RF schematics to KiCad layouts & OpenEMS scripts"
arch=($CARCH)
url="https://github.com/thomaslepoix/Qucs-RFlayout"
license=('GPL-3.0-only')
_qt=qt6
groups=()
depends=(
    gcc-libs
    glibc
    $_qt-base
)
makedepends=(
    cmake
    man-db
    mesa
    $_qt-tools
    texlive-meta
    ttf-lato
    gzip
)
checkdepends=(
    catch2
    lcov
)
optdepends=(
    'kicad: Electronic schematic and printed circuit board (PCB) design tools'
    'qucs: An integrated circuit simulator with a graphicaluser interface'
    'qucs-s: Qucs-S provides GUI for different circuit simulation kernels.'
    'openems: free and open electromagnetic field solver using the FDTD method'
    'pcb-rnd: free/open source, flexible, modular Printed Circuit Board editor'
    'inkscape: Professional vector graphics editor'
)
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('752ee3e4e2d822174a0dbc49d6b5db55023f663e2d6e824905b1f64c44decc4b')
validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    cmake -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -Wno-dev

    cmake --build build
    cmake --build build --target doc
    cmake --build build --target package
}

# check() {
#     cd "${srcdir}/${_name}-${pkgver}"
#     ctest --test-dir build --output-on-failure
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build
}
