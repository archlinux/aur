# Maintainer: Rhys Perry <rhysperry111@gmail.com>
# Based off of: community/bbswitch

pkgname=bbswitch-zen
pkgver=0.8
pkgrel=1
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
provides=('bbswitch')
conflicts=('bbswitch-dkms' 'bbswitch-git-dkms')
depends=('linux-zen')
makedepends=('linux-zen-headers')
source=("bbswitch-${pkgver}.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd bbswitch-${pkgver}
  make
}

package() {
  cd bbswitch-${pkgver}
  _kernname="$(ls -a /usr/lib/modules | grep zen$)"
  _extradir="/usr/lib/modules/${_kernname}/extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}
