# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.4.2
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
    'ae2d112b62e256d9ce9dc725fb70cbfff8108d48a4aff04837bb945c685c1392'
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
