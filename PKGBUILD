# Maintainer: Osman Karagöz <osmank3[at]gmail[dot]com>
# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=akia
pkgver=6.2.1
pkgrel=1
pkgdesc="PKCS#11 library and utility tools for Akis Smartcard"
arch=('x86_64')
url="http://www.akiskart.com.tr"
license=('custom')
makedepends=('unrar')
depends=('pcsclite' 'ccid' 'java-environment')
install=akia.install
source=(akia
        https://akiskart.bilgem.tubitak.gov.tr/dosyalar/akis_${pkgver}_amd64.rar)  
sha256sums=('cd71c80eda1674ca8b0cc8f86fdf7404b89edfc910c4460cf62ed8d706cfe609'
            '2e1fb8f8b176e3e674ec72e3f0394abc1de95a5d044e610ddf8255709c13f20a')

prepare() {
  unrar x akis_${pkgver}_amd64.rar
  ar x akis_${pkgver}_amd64.deb
}

package() {

  tar -zxf data.tar.gz -C "${srcdir}"
  
  rm -rf "${srcdir}"/usr/bin
  
  install -dm755 "${pkgdir}"/usr
  install -dm755 "${pkgdir}"/usr/bin
  
  mv "${srcdir}"/usr/* "${pkgdir}"/usr
  install -Dm755 "${srcdir}"/akia "${pkgdir}"/usr/bin/akia
}
