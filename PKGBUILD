# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=maude
pkgver=2.6
pkgrel=2
pkgdesc="High-level Specification Language."
arch=('i686' 'x86_64')
url='http://maude.cs.uiuc.edu/'
license=('GPL')
depends=('buddy' 'libtecla' 'gmp' 'libsigsegv')
makedepends=('flex' 'bison')
install=maude.install
options=(!makeflags)
source=( "http://maude.cs.uiuc.edu/download/current/Maude-$pkgver.tar.gz"
         "http://maude.cs.uiuc.edu/download/current/FM2.6/full-maude26.maude"
	 "maude.sh"
	 "patch.diff")
md5sums=('7b1dd753e9994f034a49588e2541b968'
         '7bab068a28777b1281455247f97af751'
         '0a51738365579574b40a3d32da6f3291'
         '91db8315081ac1177e5f7d17a1e28aef')
noextract=()

build() {
  cd "$srcdir/Maude-$pkgver"
  cp "$srcdir/patch.diff" ./patch.diff
  patch -p1 < patch.diff
  ./configure --prefix=/usr --datadir=/usr/share/maude
  make all 
  make check 
}

package() {
  cd "$srcdir/Maude-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m 444 "$srcdir/full-maude26.maude" \
    "$pkgdir/usr/share/maude/full-maude.maude"
  #not sure if needed
  install -D -m 555 "$srcdir/maude.sh" "$pkgdir/usr/share/maude/maude.sh"
}
