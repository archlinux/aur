# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=libcava
pkgver=1.0.0
pkgrel=1
pkgdesc='Fork to provide cava as a shared library, e.g. used by waybar. Cava is not provided as executable.'
arch=('x86_64')
url='https://github.com/LukashonakV/cava'
license=('MIT')
depends=(
    'fftw'
    'ncurses'
    'alsa-lib'
    'iniparser'
    'libglvnd'
    'sdl2'
    'portaudio'
    'sndio'
    'libpulse'
    'libpipewire'
)
makedepends=(
    'base-devel'
    'cmake'
    'meson'
    'autoconf-archive'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/LukashonakV/cava/archive/$pkgver.tar.gz"
)
sha256sums=('437df0a29e52e555357a06238f4c5cbe6d51b5dd4225700cb7adbb19d8bb9474'
)
options=(!lto)

build() {
    cd "cava-${pkgver}"

    meson setup \
          -Dcava_font=false \
          --prefix=/usr \
          build

    meson compile \
          -C \
          build
}

package() {
    cd "${srcdir}/cava-${pkgver}"

    DESTDIR="$pkgdir" meson install \
          -C \
          build

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
