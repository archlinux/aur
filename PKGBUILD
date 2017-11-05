# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=gifski
pkgver=0.4.0
pkgrel=2
pkgdesc="GIF encoder based on libimagequant (pngquant, gifquant?). Squeezes maximum possible quality from the awful GIF format"
arch=('i686' 'x86_64')
url="https://gif.ski/"
license=('AGPL3')
depends=(ffmpeg)
makedepends=(rust clang)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ImageOptim/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('35c69cfa73658fc8f88248f720693b87bbc1e95b2a28b6b7ec677ca8096bdfb4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --features=video
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/gifski "$pkgdir/usr/bin/gifski"
}
