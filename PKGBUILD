# Maintainer: Andrea Cattaneo aur@runme.sh

pkgname="tileserver-gl"
pkgver="4.4.9"
pkgrel=2
pkgdesc="Server-side rendering of vector and raster maps with GL styles"
arch=('x86_64')
url="https://github.com/maptiler/tileserver-gl"
license=('BSD')
depends=('nodejs' 'libpng' 'curl' 'libjpeg-turbo' 'libglvnd' 'libx11' 'icu66')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
#noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('00ea2a36d740726abe119b37d6e840509ac55944550b88a588e03d58c2b7ce29')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --cache "${srcdir}/npm-cache"  --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -Dm644 "${srcdir}/package/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
    chown -R root:root "${pkgdir}"
}
