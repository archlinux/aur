# Maintainer: David Adler <david . jo . adler @GMAIL>
pkgname=spectrojack
pkgver=0.4
pkgrel=1
pkgdesc="a little spectrogram/audiogram/sonogram/whatever for JACK"
arch=('i686' 'x86_64')
url="http://sed.free.fr/spectrojack/"
license=('custom')
depends=('jack' 'fftw' 'gtk2')
makedepends=()
source=("http://sed.free.fr/spectrojack/$pkgname-$pkgver.tar.gz")
md5sums=('d8cbfc174c876150d66141020244fc8d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/-fomit-frame-pointer$/& -lm/' Makefile
  sed -i 's/.*home.*/#&/' Makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 spectrojack_icon.svg $pkgdir/usr/share/spectrojack/icon.svg
  install -Dm644 -t $pkgdir/usr/share/spectrojack/colormaps colormaps/*
  install -d $pkgdir/usr/share/licenses/$pkgname
  echo -e "public domain, see\nhttp://sed.free.fr/\n" > $pkgdir/usr/share/licenses/$pkgname/licence
}

# vim:set ts=2 sw=2 et:
