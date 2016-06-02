# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=toybox
pkgver=0.7.0
pkgrel=1
pkgdesc="A BSD-licensed alternative to busybox"
arch=("i686" "x86_64")
license=("BSD")
url="http://landley.net/toybox/"
makedepends=('')
source=("${pkgname}-${pkgver}.tar.gz::http://landley.net/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg "Runing script/make.sh to allow YOU to select the options as upstream want"
  make menuconfig
  sh scripts/make.sh
}

package() {
  msg "Making directories"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"

  msg "Creating the file using make install"
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install

  msg "installing license"
  install -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/"
  cp "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/toybox/"
}
# MD5? blame Pacman dev team
md5sums=('d86c78624b47625c2f0fc64eda599443')
