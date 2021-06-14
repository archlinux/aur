# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=rtw89
pkgname=${_pkgbase}-dkms
pkgver=r66.ad12cc7
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
sha256sums=('486dbb22358931c36b234f213a55076eb5c3e8da917eab184e2dd434accc89b0'
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
