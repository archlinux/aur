# Maintainer: RedTide <redtid3@gmail.com>

pkgname=alsa-midi-latency-test-git
pkgver=r165.673a3f5
pkgrel=1
pkgdesc="Measure the roundtrip time of MIDI messages "
url="https://github.com/koppi/alsa-midi-latency-test"
arch=('x86_64')
license=('GPL-2.0')
depends=('alsa-lib')
makedepends=('git')
source=(
    "$pkgname"::"git+https://github.com/koppi/alsa-midi-latency-test.git"
)
md5sums=(
    'SKIP'
)
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
