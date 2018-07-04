# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>

_model="l8900cdw"
pkgname="brother-mfc-${_model}"
pkgver="1.2.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8900CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=(http://download.brother.com/welcome/dlf103216/mfc${_model}lpr-${pkgver}-0.i386.rpm
        http://download.brother.com/welcome/dlf103225/mfc${_model}cupswrapper-1.3.0-0.i386.rpm)
sha256sums=('82cb8b3710523b546e40e1280275ecc1689b50294644d6b81a25cbffc385e8c4'
            'd92bbb84b6b66aad097b705dd6b2a53d19cab79fde546ad7a25e4952ee4547fa')

package() {
  install -d ${pkgdir}/usr/share/cups/model/Brother
  install -d ${pkgdir}/usr/share/ppd/Brother
  install -d ${pkgdir}/usr/lib/cups/filter

  install -Dm755 ${srcdir}/usr/bin/brprintconf_mfc${_model} ${pkgdir}/usr/bin/brprintconf_mfc${_model}
  install -Dm644 ${srcdir}/opt/brother/Printers/mfc${_model}/cupswrapper/brother_mfc${_model}_printer_en.ppd ${pkgdir}/usr/share/cups/model/Brother
  install -Dm644 ${srcdir}/opt/brother/Printers/mfc${_model}/cupswrapper/brother_mfc${_model}_printer_en.ppd ${pkgdir}/usr/share/ppd/Brother

  ln -s /opt/brother/Printers/mfc${_model}/cupswrapper/brother_lpdwrapper_mfc${_model} ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfc${_model}

  cp -r ${srcdir}/opt ${pkgdir}/opt
}
