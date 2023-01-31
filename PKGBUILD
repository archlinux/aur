# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.27.9
pkgrel=1
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://reference.digilentinc.com/reference/software/adept/start"
license=('custom')
depends=('libusb')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')
source_aarch64=("https://digilent.s3.amazonaws.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-arm64.deb")
source_armv6h=("https://digilent.s3.amazonaws.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://digilent.s3.amazonaws.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-i386.deb")
source_x86_64=("https://digilent.s3.amazonaws.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
sha256sums_aarch64=('e636f5b36ba368d2947b6f4d97ff4158378832253b5d405186f690a3a017a10b')
sha256sums_armv6h=('e56e616ebacee5569a75ec830a2914cb160e5b3e495b7b5f5000e0724eae011e')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('a894d5fec5c73aec5ef1d4f1157177428028faba3688f957ee4a1db3d175735d')
sha256sums_x86_64=('4fc7be62761424c5acc2980f6f50b51976a00997bdb54463f72dedbd6b362aeb')

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
