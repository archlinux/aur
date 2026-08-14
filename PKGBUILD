# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.5.1
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
    '13ac65d21de16b01cfb17ef485351429d9546356238b9c063aaa9e7a68f3e3a8'
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
