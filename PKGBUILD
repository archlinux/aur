# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.21.2
pkgrel=1
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://reference.digilentinc.com/reference/software/adept/start"
license=('custom')
depends=('libusb')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')
source_armv6h=("https://digilent.s3.amazonaws.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://digilent.s3.amazonaws.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-i386.deb")
source_x86_64=("https://digilent.s3.amazonaws.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
sha256sums_armv6h=('0f824191680a6607e3830316383b24b8fda28d305086f527d7dda2bdb1e73769')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('d889fbb2d3a8c281452b0276f1d779b12093b4ab7a120abdeea6a1bf5517f521')
sha256sums_x86_64=('81aeadaf5e74584b73121a5dd2a5a4c6cf5ecb99ad75ce00e0a95e5ed228db07')

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Correct paths
  [ -d "${pkgdir}"/usr/lib64 ] && mv "${pkgdir}"/usr/{lib64,lib}
  [ -d "${pkgdir}"/usr/sbin ] && mv "${pkgdir}"/usr/{sbin,bin}

  # License files
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
