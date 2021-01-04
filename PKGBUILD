# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=snd-pcsp
pkgname=${_pkgbase}-dkms
pkgver=5.10.4
pkgrel=1
pkgdesc="An in-tree driver for the PC speaker which allows it to act like a primitive sound card (DKMS)"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("https://www.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.xz"
        'dkms.conf')
sha512sums=('aab782786cc06b5f1872bbb88c4f55a73d222f8ecf1ab8f5b7d96de2160b11b4407e02a44b206d2c00e395ba0662aa5a038b8e10d185621a0b33c576b523b490'
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
