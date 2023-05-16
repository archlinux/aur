# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.2.1
pkgrel=1
pkgdesc="A tempo measurement tool for composers and musicians"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/dqpb/gmetronome"
license=('GPL3')
depends=(
    'gtk3'
    'glib2'
    'gtkmm3'
    'libsigc++'
    'glibmm'
    'pangomm'
    'atkmm'
    'cairomm'
    'dconf'
    'hicolor-icon-theme'
    'glibc'
    'gcc-libs'
    'libpulse'
    'alsa-lib'
)

source=(
    "https://gitlab.gnome.org/dqpb/gmetronome/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.bz2"
    "test_destdir.patch"
)
sha256sums=(
    'e882d1f766fc79d743d5139dd3d642a7d6a27184199e76ac4643fb6086a8abe5'
    'daeb924769b791e9c79be7bbccc70403baaf00663d23d4d557dee42e94a37d5d'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/test_destdir.patch"
}

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
