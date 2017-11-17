# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=gifski
pkgver=0.6.1
pkgrel=1
pkgdesc="GIF encoder based on libimagequant (pngquant, gifquant?). Squeezes maximum possible quality from the awful GIF format"
arch=('i686' 'x86_64')
url="https://gif.ski/"
license=('AGPL3')
#depends=(ffmpeg)
makedepends=(rust clang)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ImageOptim/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('609982ab8ccab4678010305ae82e69198ba494c8e41993966ba22d652d0a9e7e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --features=openmp
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/gifski "$pkgdir/usr/bin/gifski"
}
