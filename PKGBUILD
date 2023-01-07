# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: lorim <lorimz at gmail dot com>

pkgname=libtiff5
_pkgname=tiff
pkgver=4.4.0
pkgrel=1
pkgdesc='Library for manipulation of TIFF images'
arch=('x86_64' 'aarch64')
url="http://www.simplesystems.org/libtiff"
license=('custom')
depends=('gcc-libs'
         'libjpeg-turbo'
         'zlib'
         'zstd')
source=("https://download.osgeo.org/libtiff/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed')

build() {
    cd ${_pkgname}-${pkgver}

    ./configure \
        --prefix='/usr'
    make
}

package() {
    make DESTDIR="${pkgdir}" -C ${_pkgname}-${pkgver} install
    rm -rf "${pkgdir}"/usr/{bin,include,lib/{libtiff{,xx}.{a,la,so},pkgconfig},share}
    install -Dm644 ${_pkgname}-${pkgver}/COPYRIGHT -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
