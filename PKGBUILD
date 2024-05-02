# Maintainer: Andrea Cattaneo aur@runme.sh

pkgname="tileserver-gl"
pkgver="4.11.0"
pkgrel=1
pkgdesc="Server-side rendering of vector and raster maps with GL styles"
arch=('x86_64')
url="https://github.com/maptiler/tileserver-gl"
license=('BSD')
depends=('nodejs' 'libpng' 'curl' 'libjpeg-turbo' 'libglvnd' 'libx11' 'icu66')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
#noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('58ca453cb3ec1fd506ac7f86678a8267975feab8e33b30cb2973b64c50757a03')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --cache "${srcdir}/npm-cache"  --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -Dm644 "${srcdir}/package/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
    chown -R root:root "${pkgdir}"
}
