# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: David Adler <d dot adler aet posteo dot de>

pkgname=yoshimi-git
pkgver=785.7927342
pkgrel=1
pkgdesc="ZynAddSubFX fork with improved JACK audio & MIDI IO (git version)"
arch=('i686' 'x86_64')
url="http://yoshimi.sourceforge.net/"
license=('GPL')
depends=('jack' 'fltk' 'fftw' 'mxml' 'cairo' 'lv2')
makedepends=('cmake' 'boost' 'mesa')
source=("$pkgname::git+git://git.code.sf.net/p/yoshimi/code")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname/src" 
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_DATAROOTDIR="$pkgdir/usr/share" \
    -DCMAKE_INSTALL_LIBDIR="$pkgdir/usr/lib" .
  make
}

package() {
  cd "$srcdir/$pkgname/src" 
  make install
}

# vim:set ts=2 sw=2 et:
