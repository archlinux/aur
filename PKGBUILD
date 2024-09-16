# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=3.0.0
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('x86_64')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile2.2' 'rofi')
makedepends=('autoconf-archive')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('c586dff7f36b3c0dc018d7310216d5a3c4d069a098bec7659c61ef164de6e73844c4dc54c457f967be5a7f9c536115228fb3e3ae9bfac9e45fb401c0cb1ab434'
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
