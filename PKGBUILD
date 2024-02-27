# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.3.3
pkgrel=1
pkgdesc="A tempo measurement tool for composers and musicians"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/dqpb/gmetronome"
license=('GPL3')
depends=(
    'gtkmm3'
    'libpulse'
    'alsa-lib'
)

source=(
    "https://github.com/dqpb/gmetronome/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2"
)
sha256sums=(
    'a53e51249e6029d252529f31ba8d0ba30f09de1faa236df01f22a135ff16f9af'
)

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --with-pulseaudio --with-alsa
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
