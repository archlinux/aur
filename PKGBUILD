# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=libcava
pkgver=0.9.1
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
sha256sums=('4df540b7f4892f72e48772929a15bc9ad61e2bce7a084be2df01c72ca5c02333'
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
