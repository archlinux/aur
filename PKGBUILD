# Maintainer: Hannes Mann <hannesmann2000@gmail.com>
# Contributor: Hannes Mann <hannesmann2000@gmail.com>

pkgname=gcadapter-oc-dkms
pkgver=1.4
pkgrel=2
pkgdesc="Kernel module for overclocking the Nintendo Wii U/Mayflash GameCube adapter"
arch=('any')
url="https://github.com/hannesmann/gcadapter-oc-kmod"
license=('GPL2')
depends=('dkms')
source=('https://github.com/hannesmann/gcadapter-oc-kmod/archive/v1.4.tar.gz'
        'dkms.conf')
sha256sums=('8333ee6aa10a63ebad55d36d743cc2c59878919e90b2075dba0446db6cceb625'
            '8896209dd19cfd6f9a65b1cefc0828408765f068b8a8ad565cd5e57d7ea839c7')

prepare() {
  echo "gcadapter_oc" > gcadapter-oc.conf
}

package() {
  # Copy source to /usr/src
  install -Dm644 gcadapter-oc-kmod-${pkgver}/gcadapter_oc.c "${pkgdir}"/usr/src/${pkgname}-${pkgver}/gcadapter_oc.c
  install -Dm644 gcadapter-oc-kmod-${pkgver}/Makefile "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
  # Copy dkms.conf
  install -Dm644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf
  # Set name and version
  sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf
  # Load module on boot
  install -Dm644 "${srcdir}"/gcadapter-oc.conf "${pkgdir}"/usr/lib/modules-load.d/gcadapter-oc.conf
}
