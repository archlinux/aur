# Maintainer: Osman Karagöz <osmank3[at]gmail[dot]com>
# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=akia
pkgver=6.8.4
pkgrel=1
pkgdesc="PKCS#11 library and utility tools for Akis Smartcard"
arch=('x86_64')
url="https://akiskart.bilgem.tubitak.gov.tr/"
license=('custom')
depends=('pcsclite' 'ccid' 'java-environment')
install=akia.install
source=(https://akiskart.bilgem.tubitak.gov.tr/wp-content/uploads/sites/33/2025/08/Akia_linux_6_8_4.deb_.zip
	bilgem-tubitak-gov-tr-chain.pem)
sha256sums=('0a45a4591915aabd90a33fa89ee82d39c40873aa15c6fb80350f508b5e74e1b4'
	    'ea799f417cac9516ead14331025aa41098d378438ef921190e16e009dd115c0e')
	    
DLAGENTS=("https::/usr/bin/curl --cacert bilgem-tubitak-gov-tr-chain.pem -o %o %u")

prepare() {
  ar x Akia_linux_${pkgver//./_}.deb
  tar -zxf data.tar.gz -C "${srcdir}"
  rm -rf "${srcdir}"/opt/Akia/jre
  rm -rf "${srcdir}"/opt/Akia/*.pdf
}

package() {
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir "${pkgdir}"/usr/lib
  mkdir "${pkgdir}"/usr/bin

  mv "${srcdir}"/opt/Akia/linuxRunner.txt "${pkgdir}"/usr/share/applications/akia.desktop
  mv "${srcdir}"/opt/Akia/*.so "${pkgdir}"/usr/lib
  mv "${srcdir}"/opt "${pkgdir}"/opt
  ln -s /opt/Akia/Akia "${pkgdir}"/usr/bin/akia
}
