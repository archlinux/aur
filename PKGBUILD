# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=snd-pcsp
pkgname=${_pkgbase}-dkms
pkgver=5.14.3
pkgrel=1
pkgdesc="An in-tree driver for the PC speaker which allows it to act like a primitive sound card (DKMS)"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("https://www.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.xz"
        'dkms.conf')
sha512sums=('7989beb055219414157f049942de51a36d103896fa25fb47cda8b0323991f531a5352dcbf6013c8a5e9d7e1325103025fd99a80445dd0a8c8a2790e0e20649af'
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
