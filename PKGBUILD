# Maintainer: William Grunow <william.grunow93@gmail.com>
# Contributer: Andreas Manthey <abamanthey@gmail.com>
pkgname=rtl8822bu-dkms-git
_pkgbase=rtl8822bu
pkgver=20180723
pkgrel=4
pkgdesc="Kernel module for Edimax EW7822ULC USB3 and Asus AC53 Nano USB 802.11ac adapter."
url="https://github.com/MeissnerEffect/rtl8822bu"
license=("GPL")
arch=('armv7h' 'x86_64')
makedepends=('git')
depends=('dkms')
source=('git+https://github.com/MeissnerEffect/rtl8822bu.git'  
        'dkms.conf'
        )
sha256sums=('SKIP'
            '09dbc7aa2954d0b66bf8d6676b996f154821107b72e4c0e901a14b70c64fbbe3'
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
