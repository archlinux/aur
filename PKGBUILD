# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgbase=udmabuf
pkgname=udmabuf-dkms
pkgver=2.1.3
pkgrel=2
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

sha512sums=('d522cd5b4b545204dde437aeab8f4f86e98e10fb89f3d57aee82372d8b2e392c8561c0e89c144731ffca2957a29cd4871769219e6aeba91d0d8569d212667681'
            '82bd3fa43181e6df22814217acda8262ccecd59e0b26df3a2372035b680af393e4b6304c1a32fedcd9c3288c294812855b469a6280fdd49da37c7a0d1ae00119')

package() {
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  cp -r "${srcdir}/udmabuf-${pkgver}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
