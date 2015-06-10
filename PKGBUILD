# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=sharpconstruct
pkgver=0.12
pkgrel=5
pkgdesc="Create 3D models by sculpting"
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/sharp3d/"
depends=('gtkglextmm' 'libglademm' 'libsigc++')
makedepends=('addinclude')
license=('GPL2')
sha256sums=('520195c8d96f73610eb14aefe6d1b79c835006490295ec79cc56011e9f396f0e'
            '1bf80724f4c75e3fb0c0bd4903bd0fc4fe1a024daf6d13c9dee852263cf0bbe0')
source=('http://downloads.sourceforge.net/sourceforge/sharp3d/sharpconstruct-0.12-rc3.tar.bz2'
        'arch.patch')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 < ../../arch.patch
  addinclude include/DataDir.hh malloc
  ./configure --enable-sse --prefix=/usr --mandir=/usr/share/man
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
