# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Ray Rashif <schiv@archlinux.org>

pkgname=waon
pkgver=0.10
pkgrel=1
pkgdesc="Wave-to-Notes transcriber (WAVE-MIDI converter)"
arch=('i686' 'x86_64')
url="http://waon.sourceforge.net/"
license=('GPL2')
depends=('fftw' 'libsamplerate' 'libao' 'gtk2')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('1e3c0ee9cb864c6fbfe831ed5b825fd5f20a8969ef3a6906deb88ceeee9bf8e65396f8b333bc84cf201d596467c415dfcbcd3e977a005952bae2d5983a84fa46')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's:usr/local:usr:g' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 pv $pkgdir/usr/bin/waon-pv
  install -m755 waon gwaon $pkgdir/usr/bin/
  install -Dm644 pv.1 $pkgdir/usr/share/man/man1/waon-pv.1
  install -m644 {waon,gwaon}.1 $pkgdir/usr/share/man/man1/
}
