# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=klick
pkgver=0.14.2
pkgrel=2
pkgdesc='An advanced command line based metronome for JACK'
arch=(x86_64 aarch64)
url='http://das.nasophon.de/klick/'
license=(GPL)
depends=(glibc gcc-libs)
makedepends=(boost jack liblo libsndfile rubberband scons)
# Fork of upstream with Python 3 and SCons build fixes
source=("$pkgname-$pkgver.tar.gz::https://github.com/Allfifthstuning/klick/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5d356b9b4f5abb39cea32fe435a7e5754cabb39f090a2af53dc8f0dfff0167a8')

build() {
  cd $pkgname-$pkgver
  scons PREFIX="/usr"
}

package() {
  depends+=(libjack.so liblo.so librubberband.so libsamplerate.so libsndfile.so)
  cd $pkgname-$pkgver
  scons DESTDIR="$pkgdir" install
  install -Dm644 doc/manual.html -t "$pkgdir"/usr/share/doc/$pkgname
}
