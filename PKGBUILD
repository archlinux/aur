# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Lucas Wendel <aur at igeh dot me>

pkgname=avra
pkgver=1.4.1
pkgrel=1
pkgdesc="Assembler for the Atmel AVR microcontroller family"
arch=('x86_64')
url="https://github.com/hsoft/avra"
license=('GPL')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hsoft/avra/archive/${pkgver}.tar.gz"
        'avra-flags.patch')
sha256sums=('0b92f3a2709d72b903fd95afee2c985ed3847440ad12cd651738afffa14ec69e'
            '0d131dd04a5ba909ce70ed2f1a1ef8f6cf4b28691c719e8efd5eb6102621b635')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/avra-flags.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
