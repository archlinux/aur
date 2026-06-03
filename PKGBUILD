# Maintainer: Frederick Price <fprice@pricemail.ca>
pkgname=volumepanningstereo.lv2
pkgver=0.1.2
pkgrel=1
pkgdesc="LV2 plugin that processes stereo input with volume, pan, mute, and bypass controls"
arch=('x86_64')
url="https://github.com/rickprice/VolumePanningStereo.lv2"
license=('BSD-3-Clause')
depends=('lv2')
makedepends=('pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rickprice/VolumePanningStereo.lv2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('76624ca6e65b3af0e2f16a6954508fc08be64471abf11e081d696825e2d03d32')

prepare() {
    cd "VolumePanningStereo.lv2-${pkgver}"
    make clean
}

build() {
    cd "VolumePanningStereo.lv2-${pkgver}"
    make
}

package() {
    cd "VolumePanningStereo.lv2-${pkgver}"
    install -dm755 "${pkgdir}/usr/lib/lv2/volumepanningstereo.lv2"
    install -m755 volumepanningstereo.so "${pkgdir}/usr/lib/lv2/volumepanningstereo.lv2/"
    install -m644 manifest.ttl volumepanningstereo.ttl "${pkgdir}/usr/lib/lv2/volumepanningstereo.lv2/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
