# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

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
sha512sums=('504933aff12aee8898e9c51024131cbd2e77303f8fc8e01d42a5668b1f9bca10669e38b609cf42ccc9458427e3d7cc56abdff6cd6c1fa0e7ccbb1f196273e051')

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
