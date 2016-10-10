# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.16.5
pkgrel=1
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://reference.digilentinc.com/digilent_adept_2"
license=('custom')
depends=('libusb')
conflicts=('libftd2xx')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')
#source_armv6h=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-armhf.deb")
# Unfortunately, Digilent has not yet released the new version of the runtime for ARM, so in the meantime I've
# manually set the URL for the ARM version of this package.
source_armv6h=("https://cloud.digilentinc.com/Software/Adept2/${pkgname}_2.16.1-armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-i386.deb")
source_x86_64=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
sha256sums_armv6h=('ac71ead5d05bd7e5018b33c32d2779fa5e12136c366cc7f6cbe0d70e09f9c107')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('fbd776ede8373654b8d5c0867964ae2d5fcf3dd2765d51d47ee116e388234e37')
sha256sums_x86_64=('fa8b695a61baeb07f65cf6d754e859fd47861cf9d57ce2000f0267e59c2e7926')

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
