#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=fdk-aac-enc
pkgver=2.0.3
pkgrel=3
pkgdesc='AAC encoder frontend for FDK-AAC library'
arch=(x86_64)
url='https://github.com/mstorsjo/fdk-aac'
depends=("libfdk-aac>=$pkgver")
license=(Apache-2.0)
source=("fdk-aac-$pkgver.tar.gz::https://github.com/mstorsjo/fdk-aac/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e25671cd96b10bad896aa42ab91a695a9e573395262baed4e4a2ff178d6a3a78')

build() {
  cd fdk-aac-$pkgver
  sed -i '/#include/s|libAACenc/include|fdk-aac|' aac-enc.c
  gcc $CFLAGS $LDFLAGS -o aac-enc aac-enc.c wavreader.c -lfdk-aac
}

package() {
  cd fdk-aac-$pkgver
  install -Dm755 aac-enc "$pkgdir/usr/bin/aac-enc"
}
