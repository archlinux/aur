# Contributor: Owain Sutton < owainsutton at gmail dot com >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rumor
pkgver=1.0.5
pkgrel=2
pkgdesc="A realtime monophonic (with chords) MIDI keyboard to Lilypond converter."
arch=('i686' 'x86_64')
url="https://launchpad.net/rumor"
license=('GPL')
depends=('alsa-lib' 'guile1.8')
optdepends=('alsa-oss:  for OSS compatibility')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2 gcc7.diff)
md5sums=('b4b531829e6901c958dad805cf1ab8ae'
         'd941d71954b7ae2cf01197a2ade5bff2')
options=("!makeflags")

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/gcc7.diff
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

