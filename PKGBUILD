# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=aj-snapshot
pkgver=0.9.6
pkgrel=1
pkgdesc="Command line utility to store/restore ALSA and/or JACK connections to/from an XML file."
arch=('i686' 'x86_64')
url="http://aj-snapshot.sourceforge.net/"
license=('GPL3')
depends=('jack' 'mxml')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('3f31e0b808ce70f1edbf058f1d36a366fb584a25aaf2ccadd57bb904cc80c28a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # does not build with -Wl,--as-needed
  export LDFLAGS="${LDFLAGS//,--as-needed}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
