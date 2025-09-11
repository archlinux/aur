# Maintainer: Ivan  <vantu5z@mail.ru>

_pkgbase=synaptics-led
pkgname=synaptics-led-dkms
pkgver=6.16
pkgrel=1
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/vantu5z/synaptics-led"
pkgdesc="Synaptics LED enabled psmouse kernel module. DKMS version."
depends=('dkms' 'linux>=6.16.0')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")

source=("https://github.com/vantu5z/synaptics-led/archive/refs/tags/${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('a28ca04a5ec2c68438618fa5cd137555dcacc933a418fb1a4978f4ee5f7fb905'
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
