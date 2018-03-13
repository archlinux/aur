# Maintainer: bartus <aur@bartus.33mail.com>
_pkgname=uvesafb
pkgname=${_pkgname}-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="uvesafb kernel module - dkms"
url="https://github.com/jghodd/uvesafb-dkms"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
source=("https://github.com/jghodd/uvesafb-dkms/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('038809de05feccdb2543f3285d3716d2')

build() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  # build daemon, make sure that module can be built
  make modules
  # remove those objects again, they'll be rebuild by DKMS
  make clean
}

package() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  # copy module sources and dkms.conf
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -ar * "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
}

# vim:set ts=2 sw=2 et:
