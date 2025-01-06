# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.4.1
pkgrel=1
pkgdesc="A GTK metronome featuring accents, tapping, training function and more"
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
    '8be406271c4a34d6fb22521b9a543bf7b46c059f9d359504241adcba5269b54c'
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
