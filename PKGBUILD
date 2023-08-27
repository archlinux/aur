pkgname=immich-cli
pkgrel=1
pkgver=0.41.0
pkgdesc='CLI utilities to help with some operations with the Immich app'
url='https://github.com/immich-app/cli'
license=('MIT')
arch=(x86_64)
makedepends=('npm')
depends=(
    # 'redis' 'postgresql' 'nodejs-lts-hydrogen'
    # 'typesense'
    # 'zlib'
    # 'glib2'
    # 'expat'
    # 'libjpeg-turbo'
    # 'libpng'
    # 'libjxl'
    # 'libheif'
    # 'mimalloc'
    # 'openjpeg2'
    # 'ffmpeg'
    # 'libvips'
    # 'imagemagick'
    # 'libraw'
)
optdepends=(
    # 'libva-mesa-driver: GPU acceleration'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/immich-app/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('60484beb4581095cca4fb91b1984d766aaabb5c797247a69f96708d67b6eac82')
# noextract=("${pkgname}-${pkgver}.tar.gz")
backup=()
# only for testing
options=("!strip")

build () {
    cd "${srcdir}/CLI-${pkgver}"
    npm ci
    npm run build
}

package() {
    install -Dm755 "${srcdir}/CLI-${pkgver}/package.json" "${pkgdir}/usr/lib/immich/cli/package.json"
    install -Dm755 "${srcdir}/CLI-${pkgver}/package-lock.json" "${pkgdir}/usr/lib/immich/cli/package-lock.json"
    cp -r "${srcdir}/CLI-${pkgver}/node_modules" "${pkgdir}/usr/lib/immich/cli/node_modules"
    cp -r "${srcdir}/CLI-${pkgver}/dist" "${pkgdir}/usr/lib/immich/cli/dist"
    cp -r "${srcdir}/CLI-${pkgver}/bin" "${pkgdir}/usr/lib/immich/cli/bin"
}
