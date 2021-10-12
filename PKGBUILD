# Maintainer: Ivan  <vantu5z@mail.ru>

_pkgbase=synaptics-led
pkgname=synaptics-led-dkms
pkgver=5.14.11
pkgrel=1
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/vantu5z/synaptics-led"
pkgdesc="Synaptics LED enabled psmouse kernel module. DKMS version."
depends=('dkms' 'linux>=5.10.13')
makedepends=('git' 'linux-headers>=5.10.13')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
install=${pkgname}.install

source=("https://github.com/vantu5z/synaptics-led/archive/refs/tags/${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('28a0c782a1aa8baef5589e10bc25149d6ee0235742f6358b753167921658c8a6'
            '4bae506df68782fc57471eb983b3ec332694e642c43defeeeba3e3af0802b69f')

package() {
  # Copy dkms.conf
  cd ${srcdir}
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cd ${srcdir}/${_pkgbase}-${pkgver}/synaptics-led
  cp -r mouse/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
