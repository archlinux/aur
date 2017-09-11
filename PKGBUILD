# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>
# Contributor: swearchnick <swearchnick at gmail dot com>

pkgname=tbs-firmware
pkgver=1.0
pkgrel=2
pkgdesc='TBS proprietary firmware'
arch=('any')
url='http://www.tbsdtv.com'
license=('custom:firmware')
makedepends=('linux-firmware')
depends=()
source=("http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v${pkgver}.tar.bz2")
sha256sums=('1a798179afbe80240db2bfe3afd37bbdc0ae7c04aaaf3a9b152a385bfeb4f77c')

package() {
    # Install firmware
    mkdir -p "${pkgdir}/usr/lib/firmware"
    install -m0644 "${srcdir}"/*.fw  "${pkgdir}/usr/lib/firmware"

    # Remove firmware, that is already provided by linux-firmware
    cd "${pkgdir:?}/usr/lib/firmware" && rm -f $(basename -a $(pacman -Qlq linux-firmware))
}
