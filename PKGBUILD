# Maintainer: Osman Karagöz <osmank3[at]gmail[dot]com>
# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=akia
pkgver=6.5.3
pkgrel=1
pkgdesc="PKCS#11 library and utility tools for Akis Smartcard"
arch=('x86_64')
url="https://akiskart.bilgem.tubitak.gov.tr/"
license=('custom')
depends=('pcsclite' 'ccid' 'java-environment')
install=akia.install
source=(https://akiskart.bilgem.tubitak.gov.tr/wp-content/uploads/sites/33/2023/07/Akia_linux_6_5_3.deb_.zip)
sha256sums=('a782bb7dbd66cce0c360d3a4146013989b77ce9df38d8aefe9570764461b3f82')

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
