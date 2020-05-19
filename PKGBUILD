# forked from: William Grunow <william.grunow93@gmail.com>
# Contributer: Andreas Manthey <abamanthey@gmail.com>
pkgname=rtl8822bu-dkms-raspberrypi
_pkgbase=rtl8822bu
pkgver=1.1
pkgrel=1
pkgdesc="Kernel module for Edimax EW7822ULC USB3 and Asus AC53 Nano USB 802.11ac adapter. (for raspberrypi)"
url="https://github.com/MeissnerEffect/rtl8822bu"
license=("GPL")
arch=('armv7h')
makedepends=('git')
depends=('dkms' 'linux-raspberrypi>=5.4')
conflicts=('rtl8822bu-dkms-git')
source=('git+https://github.com/MeissnerEffect/rtl8822bu.git#commit=9438d453ec5b4878b7d4a2b4bcf87b37df09c3fb'
        'dkms.conf'
        'rpi.patch'
        )
sha256sums=('SKIP'
            'deb3b32df0279a6c56738941de43ea1294349315074a33539255019b609d456e'
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
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -r "${srcdir}/${_pkgbase}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  install -D "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
