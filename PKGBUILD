# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>
pkgname=safesign-lib
pkgver=4.0.0.0
pkgrel=1
pkgdesc="Smart card PKCS#11 provider - library only"
arch=('x86_64')
url="https://certificaat.kpn.com/installatie-en-gebruik/installatie/pas-usb-stick/linux/"
license=('custom:copyright')
conflicts=('safesignidentityclient')
depends=('pcsclite' 'openssl-1.1' 'gdbm')
options=(!debug)
optdepends=('ccid: Generic support for CCID devices',
            'acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
source_x86_64=("https://certificaat.kpn.com/files/drivers/SafeSign/SafeSign%20IC%20Standard%20Linux%204.0.0.0-AET.000%20ub2204%20x86_64.deb")
sha256sums_x86_64=('2fc29e0e5dfc3e62d36ae49f3225c721ce9a7762eca3765fb32742bc17226df8')

prepare() {
  tar xvf data.tar.zst
  rm -r ${srcdir}/usr/bin
  rm -r ${srcdir}/usr/share/applications
  rm -r ${srcdir}/usr/share/icons
  rm -r ${srcdir}/usr/share/lintian
  rm -r ${srcdir}/usr/share/locale
  rm -r ${srcdir}/usr/share/man
  rm -r ${srcdir}/usr/share/safesign
  rm -r ${srcdir}/usr/lib/libaetdlglib.so*
  rm -r ${srcdir}/usr/lib/libaetdlss.so*
  rm -r ${srcdir}/usr/lib/libaetjcss.so*
}

package() {
  cp -R ${srcdir}/usr ${pkgdir}
  install -d ${pkgdir}/usr/share/licenses/safesignidentityclient
  install -m 644 ${srcdir}/usr/share/doc/safesignidentityclient/copyright ${pkgdir}/usr/share/licenses/safesignidentityclient/copyright
}
