# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jkmeter
pkgver=0.9.0
pkgrel=2
pkgdesc="A horizontal or vertical bargraph level meter based on the ideas of mastering guru Bob Katz."
arch=(aarch64 x86_64)
url='http://kokkinizita.linuxaudio.org/linuxaudio/downloads/'
license=(GPL2)
depends=(libpng)
makedepends=(clthreads clxclient libsndfile jack)
groups=(pro-audio)
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
sha256sums=('0062ca9a0d000b937364567ff41e3bf15798807c839d1a981e7fe6aedfdb7378')

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr
}

package() {
  depends+=(libclthreads.so libclxclient.so libjack.so)
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 ../README ../AUTHORS -t "$pkgdir"/usr/share/doc/$pkgname
}
