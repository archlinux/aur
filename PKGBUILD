# Maintainer: David Adler <d.adler@posteo.de>
pkgname=tranches
pkgver=0.1.1
pkgrel=7
pkgdesc="MIDI controllable beat slicer"
arch=('x86_64')
url="http://hitmuri.net/index.php/software/tranches"
license=('GPL')
depends=('fltk' 'jack')
makedepends=('scons')
source=(http://www.hitmuri.net/uploads/Software/$pkgname-$pkgver.tar.gz sconstruct_tranches.diff)
md5sums=('16e50166309caee1ea94ea944812dbb9'
         '8a3799b3e332126999081ce2f6c7fcac')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # patch SConstruct to allow for DESTDIR & PREFIX
  patch -i "$srcdir/sconstruct_tranches.diff" SConstruct

  # remove object files
  rm src/*/*.o
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  scons lash=0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  scons DESTDIR="$pkgdir" PREFIX=/usr install
}

