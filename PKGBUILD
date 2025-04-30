# Maintainer: Aleksei <alex number_three kov at zoho dot com>
pkgname=html2xhtml
pkgver=1.3
pkgrel=1
pkgdesc='HTML to XHTML converter'
arch=('x86_64' 'aarch64')
url='https://github.com/jfisteus/html2xhtml'
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('make' 'gcc')
options=('!lto')
source=(https://github.com/jfisteus/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz
  config.guess
  config.sub)
b2sums=('d3fab59dba157de4fe61138297cb4fd00b5e88dd803f8b410c59575d62db8f86ef5580e74229e68f86cf45b41ee54e4386d764940dbc92c6d355e1e2fe49042c'
        '2def6af8570e6ad05b6be314b043fd6e0a1399e1496ebe705cf999f829a6630e3d1929c7070a4ed50727f1d58e50a55d550c7a309d85d37e6b79874381177e0d'
        '3bc47650eafdea8e27597ab561c4ef754ed3a6ac4503366b620b378645ebc2bae8d71a4ff21c832ba2dc6c1df21937e9f4f7673303304058f0513f22a0fc7f51')
prepare() {
  cp -L config.guess ${pkgname}-${pkgver}/config.guess
  cp -L config.sub ${pkgname}-${pkgver}/config.sub
}
build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}
package() {
  make -C ${pkgname}-${pkgver} DESTDIR="$pkgdir/" install
}
