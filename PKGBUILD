# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=2.2.0
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('x86_64')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile2.2' 'rofi')
makedepends=('autoconf-archive')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('ce31456c7165671a7d73daa854bccf51a3b263ad683a5b6f99f98cfba95ff16134f3aa2e4175a0eee4a10476adc3b266a661e848846289b8d168626ab424f21c'
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
