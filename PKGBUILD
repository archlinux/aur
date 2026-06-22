# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=acarsdec
pkgver=4.6
pkgrel=1
pkgdesc="Multi-channel ACARS decoder"
arch=('x86_64')
url="https://github.com/f00b4r0/acarsdec"
license=('GPL-2.0-only')
depends=('airspy' 'alsa-lib' 'cjson' 'libsndfile' 'rtl-sdr' 'soapysdr')
makedepends=('cmake')
optdepends=('acarsserv: Store messages in sqlite database')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b317ce10791cdf804116e91d09d4b34aac6bac8f8c40ff48f632ca01f2183128')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DALSA=ON \
    -DAIRSPY=ON \
    -DCJSON=ON \
    -DRTLSDR=ON \
    -DSNDFILE=ON \
    -DSOAPYSDR=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build --prefix /usr
}

