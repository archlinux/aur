# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=cyanrip
pkgver=0.9.2
pkgrel=1
pkgdesc='Fully featured CD ripping program'
arch=('x86_64')
url='https://github.com/cyanreg/cyanrip'
license=('GPL3')
depends=('curl' 'ffmpeg' 'libcdio-paranoia' 'libmusicbrainz5')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cyanreg/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('bae86ab799a28f5bbdfaf664c03a66c3c2d9c296239811163cbc04f1ce42646e086f33e505ceeb379ffb289d6b89f66f0abd6d36b323e873f9aae97878a3fc2e')

build() {
    cd "${pkgname}-${pkgver}"
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}
