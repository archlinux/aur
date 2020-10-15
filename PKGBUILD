# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>

_model="l8900cdw"
pkgname="brother-mfc-${_model}"
pkgver="1.5.0"
pkgrel=2
epoch=2
pkgdesc="LPR and CUPS driver for the Brother MFC-L8900CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=(https://download.brother.com/welcome/dlf103216/mfcl8900cdwlpr-${pkgver}-0.i386.rpm
        https://download.brother.com/welcome/dlf103225/mfcl8900cdwcupswrapper-${pkgver}-0.i386.rpm)
sha256sums=('SKIP'
            'SKIP')

package() {
  install -d ${pkgdir}/usr/share/cups/model/Brother
  install -d ${pkgdir}/usr/share/ppd/Brother
  install -d ${pkgdir}/usr/lib/cups/filter

  install -Dm755 ${srcdir}/opt/brother/Printers/mfc${_model}/lpd/${CARCH}/brprintconf_mfc${_model}  ${pkgdir}/usr/bin/brprintconf_mfc${_model}
  install -Dm644 ${srcdir}/opt/brother/Printers/mfc${_model}/cupswrapper/brother_mfc${_model}_printer_en.ppd ${pkgdir}/usr/share/cups/model/Brother
  install -Dm644 ${srcdir}/opt/brother/Printers/mfc${_model}/cupswrapper/brother_mfc${_model}_printer_en.ppd ${pkgdir}/usr/share/ppd/Brother

  ln -s /opt/brother/Printers/mfc${_model}/cupswrapper/brother_lpdwrapper_mfc${_model} ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfc${_model}

  cp -r ${srcdir}/opt ${pkgdir}/opt
}
