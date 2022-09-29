# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=snd-pcsp
pkgname=${_pkgbase}-dkms
pkgver=5.19.12
pkgrel=1
pkgdesc="An in-tree driver for the PC speaker which allows it to act like a primitive sound card (DKMS)"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("https://www.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.xz"
        'dkms.conf')
sha512sums=('567dfb4302ea6a8961ad3b6dba332a925d262fbc8830a77da75a7be19db3cb19080260787cfcd0318b7893b71c655e2bcb1fc71dd07ff5627064fd33635bb2a4'
            '34a3d64891ca6306304caf911c740c7770e13e9a62d026d0fd104e3da12981ac2a0f829dcf68cc604083741c17563e2a6fce70a305e670f4a2ac3feaa14a69e0')

package() {
  # Copy dkms.conf
  install -Dt "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" -m644 dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -rT linux-${pkgver}/sound/drivers/pcsp "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
