# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=acarsdec
pkgver=4.7
pkgrel=1
pkgdesc="Multi-channel ACARS decoder"
arch=('x86_64')
url="https://github.com/f00b4r0/acarsdec"
license=('GPL-2.0-only')
depends=('airspy' 'alsa-lib' 'cjson' 'libacars' 'libsndfile' 'rtl-sdr' 'soapysdr')
makedepends=('cmake')
optdepends=('acarsserv: Store messages in sqlite database')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('41d681e1b4b202ae53a98fac6f0d2eeb6eee4f7ce2994f06d4937c70bb96beb0')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DALSA=ON \
    -DAIRSPY=ON \
    -DCJSON=ON \
    -DLIBACARS=ON \
    -DRTLSDR=ON \
    -DSDRPLAY=OFF \
    -DSNDFILE=ON \
    -DSOAPYSDR=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build --prefix /usr
}

