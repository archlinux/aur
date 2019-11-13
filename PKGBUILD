# Maintainer: Andreas Manthey <abamanthey@gmail.com>
# Contributor: Andreas Manthey <abamanthey@gmail.com>
pkgname=tuxedo-keyboard-dkms
_pkgbase=tuxedo-keyboard
pkgver=2.0
pkgrel=1
pkgdesc="Tuxedo Computers Kernel module for keyboard backlightning."
url="https://github.com/tuxedocomputers/tuxedo-keyboard"
license=("GPL")
arch=('x86_64') 
makedepends=('git' 'linux-headers' 'gcc' 'make')				# bei lts oder hardened Kernel entsprechend anpassen
depends=('dkms')
source=('git+https://github.com/tuxedocomputers/tuxedo-keyboard.git'
         'dkms.conf' 
         )
sha256sums=('SKIP'
            'd803c7f8cd86cb705cf2ccb4e7cdc3da7cbc475a665d3f15f93a8b07664afe8c'
            )
install="${pkgname}.install"
prepare() {
  sed -e "s/@PKGNAME@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${srcdir}/dkms.conf"      
  (cd ${srcdir}/${_pkgbase} )
}
package() {
  install -D "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  cp -r "${srcdir}/${_pkgbase}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
