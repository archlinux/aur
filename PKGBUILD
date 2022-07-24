# Maintainer: Osman Karagöz <osmank3[at]gmail[dot]com>
# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=akia
pkgver=6.3.3
pkgrel=2
pkgdesc="PKCS#11 library and utility tools for Akis Smartcard"
arch=('x86_64')
url="https://akiskart.bilgem.tubitak.gov.tr/"
license=('custom')
depends=('pcsclite' 'ccid' 'java-environment')
install=akia.install
source=(https://akiskart.bilgem.tubitak.gov.tr/dosyalar/akia-linux-deb-${pkgver}.zip
        bilgem-tubitak-gov-tr-chain.pem)
sha256sums=('ba0b455fb74353b5d151013126bddc5c8ac83a8dd66fa67851a4f154a876ebea'
            'ff36350b5c74a23b1f0454b973cd9fd0d840936bba32137e35c966143d7d1ae4')

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
