# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=heif
pkgver=3.6.0
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('7e3285c4dc80c5c34ee667b6488529cbf3a0cf4878f8eff656b91bdb96cb05623e9b9df2f015e3ceb77b0b19efd3e7a0d482b04fc5ec0987270f055bccde9885')

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
