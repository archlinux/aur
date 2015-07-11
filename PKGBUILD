# Maintainer: aggraef@gmail.com
pkgname=osc2midi-utils-git
pkgver=91.4a45221
pkgrel=1
pkgdesc="Utilities and GTK frontend for OSC2MIDI (git version)"
arch=('x86_64' 'i686')
url="https://bitbucket.org/agraef/osc2midi-utils/"
license=('BSD')
depends=('osc2midi' 'pure' 'pure-avahi' 'pure-ffi' 'pure-liblo' 'pure-sockets' 'pure-tk' 'pure-xml' 'gnocl' 'gnocl-builder' 'gnocl-gconf' 'desktop-file-utils')
optdepends=('touchosc-editor: create and edit TouchOSC layouts')
makedepends=()
provides=('osc2midi-utils')
conflicts=('osc2midi-utils')
install="osc2midi-utils.install"
source=("$pkgname::git+https://bitbucket.org/agraef/osc2midi-utils")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
  make prefix=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make install prefix=/usr DESTDIR="$pkgdir"
  # documentation and examples
  install -Dm644 README.md $pkgdir/usr/share/doc/osc2midi-utils/README.md
  install -dm755 $pkgdir/usr/share/doc/osc2midi-utils/examples
  install -Dm644 examples/* $pkgdir/usr/share/doc/osc2midi-utils/examples
}
