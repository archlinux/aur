# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=libcava
pkgver=0.8.5
pkgrel=2
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
sha256sums=('9ce3df7d374dc83ed0704fe3caef5e00600ce061d85608aad4142d2c59aa4647'
)

build() {
    cd "cava-${pkgver}"

    # enable flag `experimental` to activate module wlr/workspaces
    meson setup \
          --prefix=/usr \
          -Dbuild_target=lib \
          build

    ninja -C build
}

package() {
    cd "${srcdir}/cava-${pkgver}"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
