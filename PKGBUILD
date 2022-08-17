# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=1.8.3.1
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="https://freedv.org/"
depends=('libpulse' 'hamlib' 'sox' 'wxwidgets-gtk3' 'codec2' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'lpcnetfreedv')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('550c78e72974d1cca80e10c5c2ab7d047c663b152feda48fa776dec32fbedb6e78c5b92e048070ad4c30ce9011999bf9e0a218e20a9c19d37a7ef8e791b6fb74')

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
