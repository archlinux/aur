# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-octave
pkgver=0.9
pkgrel=2
pkgdesc="embed an Octave interpreter into Pure."
arch=("i686" "x86_64")
license=('GPL3')
url="http://purelang.bitbucket.org/"
# NB: Currently requires octave-hg (4.3.0+) to build, Octave 4.2 is broken.
depends=('pure' 'octave')
makedepends=()
groups=(pure-complete pure-math)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz" octave-4.3-compat.diff)
sha1sums=('2d4b3cad23aadcd33925cea04661e2eab6109423'
          'db422de2b028ec284e19e2d8fd5e840540875d48')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	patch -p2 < ../octave-4.3-compat.diff
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install 
}
