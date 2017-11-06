# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=gifski
pkgver=0.5.0
pkgrel=1
pkgdesc="GIF encoder based on libimagequant (pngquant, gifquant?). Squeezes maximum possible quality from the awful GIF format"
arch=('i686' 'x86_64')
url="https://gif.ski/"
license=('AGPL3')
#depends=(ffmpeg)
makedepends=(rust clang)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ImageOptim/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('6cf9a69ad141c6bf61f6f8b5ba507c06aaf0d401351768d2cd790fe27d6a9de7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --features=openmp
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/gifski "$pkgdir/usr/bin/gifski"
}
