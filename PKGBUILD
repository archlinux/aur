pkgname=lynx2svg
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert Lynx (.lynx) presentations to SVG and PNG"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/fdai7909/lynx2svg"
license=('MIT')

depends=(
    'libxml2'
    'zlib'
)

makedepends=(
    'cmake'
    'ninja'
    'git'
)

optdepends=(
    'inkscape: PNG rendering'
    'librsvg: alternative PNG renderer'
    'imagemagick: alternative PNG renderer'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)

sha256sums=('SKIP')

build() {
    cmake -B build \
        -S "${srcdir}/${pkgname}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
