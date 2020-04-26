# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=heif
pkgver=3.5.0
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}.tar.gz")
b2sums=('974f0a2721cbbba57fb2644aeb76e262a8e69537036900d95718565e455bd5ec30429457e34e51401e7944299b9bb97993264c909e063ac7f12f72a1402923ce')

build() {
  cd ${pkgname}-${pkgver}/build/
  cmake ../srcs
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -dm755 "${pkgdir}"/usr/lib/heif/
  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}
  cp -r srcs/api "${pkgdir}"/usr/lib/heif/
  cd build/lib/
  install -Dm644 -t "${pkgdir}"/usr/lib/ ./*
}
