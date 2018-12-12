# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>
# Contributor: swearchnick <swearchnick at gmail dot com>

pkgname=tbs-firmware
pkgver=1.0
pkgrel=4
pkgdesc='TBS proprietary firmware'
arch=('any')
url='http://www.tbsdtv.com'
license=('custom:firmware')
makedepends=('linux-firmware')
depends=()
source=("http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v${pkgver}.tar.bz2")
sha256sums=('105288b21c525f858cab0db1e712ad2e500d6aee9a701f5599595bcfbdf35597')

package() {
    # Install firmware
    mkdir -p "${pkgdir}/usr/lib/firmware"
    install -m0644 "${srcdir}"/*.fw  "${pkgdir}/usr/lib/firmware"

    # Remove firmware, that is already provided by linux-firmware
    cd "${pkgdir:?}/usr/lib/firmware" && rm -f $(basename -a $(pacman -Qlq linux-firmware))
}
