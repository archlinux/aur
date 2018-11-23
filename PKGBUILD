# Maintainer: Peter Majchrak <petoknm@gmail.com>

_model="l9550cdw"
pkgname="brother-mfc-${_model}"
pkgver="1.0.0"
pkgrel=1
epoch=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L9550CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=(
  https://download.brother.com/welcome/dlf101098/mfc${_model}lpr-1.1.2-1.i386.rpm
  https://download.brother.com/welcome/dlf101099/mfc${_model}cupswrapper-1.1.3-1.i386.rpm
)
sha256sums=(
  '648635ad4698bf1f57ca6009bc894ab7a49c2e595acbafc26018c0955d97495e'
  'a0c1d127d106009368a4e62d83fc6b2d2c8e573e10d0a2399b15587a6238e472'
)

package() {
  install -d ${pkgdir}/usr/share/cups/model/Brother
  install -d ${pkgdir}/usr/share/ppd/Brother
  install -d ${pkgdir}/usr/lib/cups/filter

  install -Dm755 ${srcdir}/usr/bin/brprintconf_mfc${_model} ${pkgdir}/usr/bin/brprintconf_mfc${_model}
  install -Dm644 ${srcdir}/opt/brother/Printers/mfc${_model}/cupswrapper/brother_mfc${_model}_printer_en.ppd ${pkgdir}/usr/share/cups/model/Brother
  install -Dm644 ${srcdir}/opt/brother/Printers/mfc${_model}/cupswrapper/brother_mfc${_model}_printer_en.ppd ${pkgdir}/usr/share/ppd/Brother

  ln -s /opt/brother/Printers/mfc${_model}/cupswrapper/cupswrappermfc${_model} ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfc${_model}

  cp -r ${srcdir}/opt ${pkgdir}/opt
}
