# Maintainer: Osman Karagöz <osmank3[at]gmail[dot]com>
# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=akia
pkgver=6.5.6
pkgrel=1
pkgdesc="PKCS#11 library and utility tools for Akis Smartcard"
arch=('x86_64')
url="https://akiskart.bilgem.tubitak.gov.tr/"
license=('custom')
depends=('pcsclite' 'ccid' 'java-environment')
install=akia.install
source=(https://akiskart.bilgem.tubitak.gov.tr/wp-content/uploads/sites/33/2023/12/Akia_linux_6_5_6.deb_.zip)
sha256sums=('504646cb97d3ad1f9b07f08cad03beedcbafe9b3a54c90fd20f138f701caebad')

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
