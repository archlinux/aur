# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.16.1
pkgrel=2
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('i686' 'x86_64')
url="https://reference.digilentinc.com/digilent_adept_2"
license=('custom')
depends=('libusb')
conflicts=('libftd2xx')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')
source_i686=("https://cloud.digilentinc.com/Software/Adept2/${pkgname}_${pkgver}-2_i386.deb")
source_x86_64=("https://cloud.digilentinc.com/Software/Adept2/${pkgname}_${pkgver}-2_amd64.deb")
sha256sums_i686=('c693fe2eebe96ea4f6977a0ffbebd02e2f6eeea530df28865b4f5e590c70012e')
sha256sums_x86_64=('510a3c36c8931673cbe4fd6bee39a0b7edbc962b7796aff1b39f0a4f07712e3a')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Correct paths
  [ -d "${pkgdir}"/usr/lib64 ] && mv "${pkgdir}"/usr/{lib64,lib}
  [ -d "${pkgdir}"/usr/sbin ] && mv "${pkgdir}"/usr/{sbin,bin}

  # License files
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
