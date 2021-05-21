# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=rtw89
pkgname=${_pkgbase}-dkms
pkgver=r59.e382af1
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
sha256sums=('9337aa656a9fa5b3151079b3799599c633ee7a28fe7b2d10e54555b25cf6b0e6'
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
