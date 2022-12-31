# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=1.8.6
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="https://freedv.org/"
depends=('libpulse' 'hamlib' 'sox' 'wxwidgets-gtk3' 'codec2' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'lpcnetfreedv')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bcbd6b302ae1af7edb00069b33338598703b427edef4c77e27d6a153ba0218d8685b8cf09d07e1b7e1ca94f661ce5d70577f6205a94710fb291e3e13d2c88f50')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_INTERNAL_CODEC2=FALSE \
    -DUSE_STATIC_SPEEXDSP=FALSE \
    -DBOOTSTRAP_WXWIDGETS=FALSE \
    -DUSE_PULSEAUDIO=TRUE
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -m644 -D "$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
