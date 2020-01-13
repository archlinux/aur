# forked from: William Grunow <william.grunow93@gmail.com>
# Contributer: Andreas Manthey <abamanthey@gmail.com>
pkgname=rtl8822bu-dkms-raspberrypi
_pkgbase=rtl8822bu
pkgver=1.0
pkgrel=1
pkgdesc="Kernel module for Edimax EW7822ULC USB3 and Asus AC53 Nano USB 802.11ac adapter. (for raspberrypi)"
url="https://github.com/MeissnerEffect/rtl8822bu"
license=("GPL")
arch=('armv7h')
makedepends=('git')
depends=('dkms')
conflicts=('rtl8822bu-dkms-git')
source=('git+https://github.com/MeissnerEffect/rtl8822bu.git#commit=dea3bb8e631191ded1839c53fb266d80ef7e8ad3'
        'dkms.conf'
        'rpi.patch'
        )
sha256sums=('SKIP'
            '09dbc7aa2954d0b66bf8d6676b996f154821107b72e4c0e901a14b70c64fbbe3'
            '1231ecd3d8937fa6e626b5b265a6ee2a7299cb2f7e8a2b19f60ae3875bf9142d'
            )
install="${pkgname}.install"
prepare() {
  sed -e "s/@PKGNAME@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${srcdir}/dkms.conf"      

  (cd "$srcdir/" && patch --strip=1 --input=rpi.patch)

  (cd ${srcdir}/${_pkgbase} )

}
package() {
  install -D "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  cp -r "${srcdir}/${_pkgbase}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
