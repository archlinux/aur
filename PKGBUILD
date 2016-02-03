# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org<
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=zita-rev1
pkgver=0.2.1
pkgrel=2
pkgdesc="A reworked jack version of the reverb originally developed for Aeolus."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/zita-rev1-doc/quickguide.html"
license=('GPL')
depends=('jack' 'cairo' 'clxclient' 'clthreads')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('f1403a7b85a7aa4bbac66c08abfd8293')

prepare() {
  cd $pkgname-$pkgver/source

  # strip march=native
  sed -i '/native/d' Makefile
}

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver/source
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  # doc
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ../doc/* "$pkgdir/usr/share/doc/$pkgname"
}
