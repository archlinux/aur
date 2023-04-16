# Maintainer: Andrea Cattaneo aur@runme.sh

pkgname="tileserver-gl"
pkgver="4.4.10"
pkgrel=1
pkgdesc="Server-side rendering of vector and raster maps with GL styles"
arch=('x86_64')
url="https://github.com/maptiler/tileserver-gl"
license=('BSD')
depends=('nodejs' 'libpng' 'curl' 'libjpeg-turbo' 'libglvnd' 'libx11' 'icu66')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
#noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('4c33d1d2a601e182f9700e324e694b4210ab459bca562072dab006b5cc1645e4')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --cache "${srcdir}/npm-cache"  --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -Dm644 "${srcdir}/package/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
    chown -R root:root "${pkgdir}"
}
