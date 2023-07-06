# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.3.1
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
    "https://gitlab.gnome.org/dqpb/gmetronome/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.bz2"
)
sha256sums=(
    'bc3196698bef04f4031f1b0c09799dab5bd5afe26af8b7946ddfdf4c51d5965c'
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
