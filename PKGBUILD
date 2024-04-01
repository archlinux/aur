# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=2.1.0
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('x86_64')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile2.2' 'rofi')
makedepends=('autoconf-archive')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('63c7aa0fa4e23955576474e3e9ac3cf699269beae77a4ba9fc9d7f281c09e48f87e54f5013fdfc30b0ba12a06ae4a0dcca9105ed99ae15a824f17305312849bd'
        '807b094561801b696f11f57819fc94283a7aa344cb00cbc7aea374c6e669e09ac85a9e07327b100fe544fd8149b3a4dfa4b94dd6ce9746810427a07dc2f5b01d')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -vif
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/pinentry-rofi LICENSE
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" make install
}
