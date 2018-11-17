# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.17.1
pkgrel=1
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://reference.digilentinc.com/reference/software/adept/start"
license=('custom')
depends=('libusb')
conflicts=('libftd2xx')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')
source_armv6h=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-i386.deb")
source_x86_64=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
sha256sums_armv6h=('4d5589be1d0da1f38a3223bbb78251777aacbe02fe10c06f84933537002d3f53')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('c03cf9799727fbbea303cc2b7d21f7dd2117fe29185b9b314e45c11773459fef')
sha256sums_x86_64=('404749e36991c5da89dfb3e0298f1c72bf5cee3bfcdc242b98fc6a36e8993249')

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
