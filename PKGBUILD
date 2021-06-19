# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=rtw89
pkgname=${_pkgbase}-dkms
pkgver=r69.b0ad99f
pkgrel=1
_srcver=${pkgver#*.}
pkgdesc="Driver for Realtek 8852AE, an 802.11ax device"
arch=('x86_64')
url="https://github.com/lwfinger/rtw89"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("https://github.com/lwfinger/rtw89/archive/${_srcver}.tar.gz"
        'dkms.conf')
sha256sums=('af102e5406ed1f7625bc00e7ac38ea9e4b7219e81b85e1b2ad382f1728d878aa'
            'd4015a9c63b86baa120b558f4acc19c60fe5cbea7ded338173e08cec47327b40')

package() {
  # Copy dkms.conf
  install -Dt "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" -m644 dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -rT rtw89* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
