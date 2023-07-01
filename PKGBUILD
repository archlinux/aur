# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.3.0
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
    '6260b7bd47d58b580180b27cf0210aca9bb1c63be36ee1673a794e49d612fd67'
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
