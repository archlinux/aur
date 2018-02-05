# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=gifski
pkgver=0.8.0
pkgrel=2
pkgdesc="GIF encoder based on libimagequant (pngquant, gifquant?). Squeezes maximum possible quality from the awful GIF format"
arch=('i686' 'x86_64')
url="https://gif.ski/"
license=('AGPL3')
depends=(gcc-libs ffmpeg)
makedepends=(rust clang)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ImageOptim/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('f3cab822dd41de17ba4fdc3b8d379b469404573b1a4adcb5f9c9385a7a927760')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --features=video,openmp
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/gifski "$pkgdir/usr/bin/gifski"
}
