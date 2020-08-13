# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=heif
pkgver=3.6.1
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('d3fdc1db3f8d8b6c9c4a7fc6451b222abb56619d085fc9c5742daf6ffdf06967031c5d057aba8eb26132e3ce41548bc72b297250ef9bfe2ca84ea6776a0660f6')

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
