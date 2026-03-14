# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>
# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>

_pkgbase=blksnap
_pkgname=veeam${_pkgbase}
pkgname=${_pkgname}-dkms
pkgver=13.0.1.404
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=(x86_64)
url=https://www.veeam.com/products/downloads.html
license=(LicenseRef-GPL-2.0)
depends=(dkms)
conflicts=("${_pkgbase}")
source=("https://repository.veeam.com/backup/linux/agent-13/rpm/el/10/x86_64/blksnap-${pkgver}-1.noarch.rpm"
    'dkms.conf')
sha256sums=('7cf2d8613710fd3c40564ecb1a623de880273e668713c6675731c573302ae3c9'
            '21a182149740160df2d3475fad4142a08d8fc850e0234d32922472f7e4aa66fc')

package() {
  local target="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${target}"

  # Copy sources (including Makefile)
  cp -r "${srcdir}/usr/src/${_pkgbase}-${pkgver}/." "${target}/"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${target}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${target}/dkms.conf"
}
