# Maintainer: Jan Holthuis <holthuis dot jan at googlemail dot com>
# Based on crark-opencl by GI Jack <iamjacksemail@hackermail.com>

pkgname=crark-7z
download="crark7z-12-linux.7z"
pkgver=1.2
pkgrel=1
pkgdesc="A command-line utility for 7-Zip 3.x-10.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors."
arch=('x86_64')
url="http://www.crark.net/"
license=("freeware-proprietary")
depends=('7z')
depends=('libcl')
makedepends=('p7zip')
source=("http://www.crark.net/download/${download}")
noextract=("${download}")
sha256sums=('fd54bd513d9a4e0fb8c3c054538dc87c77bc0c34f10bb7b02dcdd477f69b5fb0')
install=${pkgname}.install

prepare() {
  mkdir -p "${pkgname}-${pkgver}"
  7z e -y '-x!crackme' "-o${pkgname}-${pkgver}" "${download}"
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -R "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/opt/${pkgname}"
  chmod +r "${pkgdir}/opt/${pkgname}"/{spanish,english,russian}.def
}

