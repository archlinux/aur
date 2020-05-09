# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgbase=udmabuf
pkgname=udmabuf-dkms
pkgver=2.1.4
pkgrel=1
pkgdesc="Userspace DMA Buffers"
arch=('i686' 'x86_64' 'armhf')
url="https://github.com/ikwzm/udmabuf"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=(
    "udmabuf-${pkgver}.tar.gz::https://github.com/ikwzm/udmabuf/archive/v${pkgver}.tar.gz"
    "dkms.conf"
)

sha512sums=('15bacedc74407110457b8de9d2c0e50a0456f2c84f2119bcc1ab5f3b869c3a613321e34c2241a916283faebf9652eaf88c955a320fb89b76f2121f2af53934f9'
            '82bd3fa43181e6df22814217acda8262ccecd59e0b26df3a2372035b680af393e4b6304c1a32fedcd9c3288c294812855b469a6280fdd49da37c7a0d1ae00119')

package() {
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  cp -r "${srcdir}/udmabuf-${pkgver}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
