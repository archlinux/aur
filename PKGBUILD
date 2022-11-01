# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jmeters
pkgver=0.4.5
pkgrel=2
pkgdesc='Various analog-style audio level meters for JACK'
arch=(aarch64 x86_64)
url='http://kokkinizita.linuxaudio.org/linuxaudio/downloads/'
license=(GPL2)
depends=(cairo)
makedepends=(clthreads clxclient libsndfile jack)
groups=(pro-audio)
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
sha256sums=('1f37d1c4783bb9381ff865a98ed98369b03e280b5629f6bb4a1c5f864bf4becc')

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
