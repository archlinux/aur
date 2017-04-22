# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.16.6
pkgrel=1
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://reference.digilentinc.com/digilent_adept_2"
license=('custom')
depends=('libusb')
conflicts=('libftd2xx')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')
source_armv6h=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-i386.deb")
source_x86_64=("https://files.digilent.com/Software/Adept2+Runtime/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
sha256sums_armv6h=('2053e2bc6d09f1804bbb39e3376de04bcde86c7737c4a35578392acbdef7509f')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('746a5f6b4fa2e943adf7463ae2d59af01b5911fb4a91274724a8da0af70c5193')
sha256sums_x86_64=('3042a7a7944dc612b092f2cccf27a7053f122f7be13be4ffa96cca100389f80e')

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
