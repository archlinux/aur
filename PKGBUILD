# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.3.4
pkgrel=1
pkgdesc="A GTK metronome and tempo measurement tool"
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
    '05dd9c691c888b3316f9ecc15567c40f1bc3f3210d225aa38ea2ff86a418a27b'
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
