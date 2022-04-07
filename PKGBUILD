# Maintainer: Sebastián Zambrano <yeaseb@gmail.com>
# Contributor: Sebastián Zambrano <yeaseb@gmail.com>, Hannes Mann <hannesmann2000@gmail.com>

pkgname=wmo_oc-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Kernel module for overclocking the MS Wheel Mouse Optical (MLT04)."
arch=('any')
url="https://github.com/YeaSeb/wmo-oc-kmod"
license=('GPL2')
depends=('dkms')
source=('https://github.com/YeaSeb/wmo-oc-kmod/archive/refs/tags/1.0.zip'
        'dkms.conf')
md5sums=('4992b4f8828a951ea9a1b78931d245c7'
         'c0214b179a1d286fd59c82117109399e')

prepare() {
  echo "wmo_oc" > wmo-oc.conf
}

package() {
  # Copy dkms.conf
  install -Dm644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  # Load module on boot
  install -Dm644 "${srcdir}"/wmo-oc.conf "${pkgdir}"/usr/lib/modules-load.d/wmo-oc.conf

  # Set name and version
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  cp -r wmo-oc-kmod-${pkgver}/* "${pkgdir}"/usr/src/${pkgname}-${pkgver}/
}
