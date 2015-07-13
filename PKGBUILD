# Maintainer: aggraef@gmail.com
# Contributor: x@safe-mail.net where x stands for jbjunk
pkgname=osc2midi-git
pkgver=197.d46ec38
pkgrel=1
pkgdesc="OSC2MIDI is a highly configurable OSC to jack MIDI (and back) bridge for linux (git version)"
arch=('x86_64' 'i686')
url="https://github.com/ssj71/OSC2MIDI"
license=('GPL')
depends=('jack' 'liblo')
makedepends=('cmake')
provides=('osc2midi')
conflicts=('osc2midi')
source=("$pkgname::git+https://github.com/ssj71/OSC2MIDI.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$pkgname"
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build
	make install DESTDIR="$pkgdir"
}
