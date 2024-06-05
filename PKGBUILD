# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=cyanrip
pkgver=0.9.3.1
pkgrel=1
pkgdesc='Fully featured CD ripping program'
arch=('x86_64')
url='https://github.com/cyanreg/cyanrip'
license=('GPL3')
depends=('curl' 'ffmpeg' 'libcdio-paranoia' 'libmusicbrainz5')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cyanreg/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f5c9ee1920aa930e6a096a550e19ed9602f1709384d3d76766ae7d60ff7625c88960e84459b4179a80b5b7a939698198a5b3d9e37a4aa472dccd71c5201a9727')

build() {
    cd "${pkgname}-${pkgver}"
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}
