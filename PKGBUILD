# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=2.0.4
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('x86_64')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile' 'rofi')
makedepends=('autoconf-archive')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('168da4e7b8bda82b67e7ddc376cd46d1c83983c4b892729cb842d59f4ae520eb782601a4022b1f98d7ef1cf067edb2cc9c297d2cc14042d12a8866a4695d9008'
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
