# Maintainer: p.devil <p dot devil at gmail dot com>
pkgbase="fujprog"
pkgname="$pkgbase"
pkgver="4.6"
pkgrel="1"

pkgdesc="ULX2S / ULX3S JTAG programmer"
arch=("x86_64")
url="https://github.com/kost/${pkgbase}"
license=("BSD")

depends=("libftdi" "libusb")
makedepends=("cmake")

source=("${pkgbase}-${pkgver}::https://github.com/kost/${pkgbase}/archive/v${pkgver}.tar.gz")
sha1sums=('bdc741829b5dbc51872aec57482df20ed90d12ff')
sha256sums=('e6a2732b294e2b051aa3505faed13bd143630fa5564bf86bbebedaf5ff9dbb15')

build() {
    cmake -B build -S "${pkgbase}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
