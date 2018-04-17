# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=adonthell
pkgver=0.3.6
pkgrel=1
pkgdesc="A 2D graphical, single player role playing game engine"
arch=('x86_64')
url="http://adonthell.nongnu.org/"
license=('GPL2')
depends=('sdl2_mixer' 'sdl2_ttf' 'python')
makedepends=('swig')
options=('emptydirs')
source=("http://savannah.nongnu.org/download/adonthell/$pkgname-src-$pkgver.tar.gz"
        'fix-multi-monitor.patch')
sha256sums=('3b5724ef734a1064899af7e8d693b532e97596a4e94f61e7af5d15eb9ee748cd'
            'f9853a475706f077e258f965d035696ba6cacdbfc3512b5c622ec6c647882331')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir/fix-multi-monitor.patch"
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
