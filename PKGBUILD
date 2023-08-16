# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=1.9.0
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('x86_64' 'aarch64')
license=('LGPL2.1')
url="https://freedv.org/"
depends=('libpulse' 'hamlib' 'sox' 'wxwidgets-gtk3' 'codec2-lpcnet' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'lpcnetfreedv')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('33eb769409c9cccba1a8eb95ca2ad924662794b083032f69c061ff524f827ec9f937f18122b7e2b4984c82dc4f38f3c9dfe3d6975b80f3631721030859b64de8')

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
