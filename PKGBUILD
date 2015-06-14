# Maintainer: WB2FKO <mph at sportscliche dot com>
pkgname=linpsk
pkgver=1.2
pkgrel=1
pkgdesc="PSK31 for Linux"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/linpsk/"
license=('GPL')
depends=('fftw' 'qt4' 'alsa-lib')
install=linpsk.install
source=(http://sourceforge.net/projects/linpsk/files/linpsk/$pkgname-$pkgver/$pkgname-$pkgver.tgz
              $pkgname.desktop 
              )
md5sums=( '674c783fd772a532a7b8a107ae69ec1e'
          '88dcc2a61895c89c63e4f900d2f9481c' )

build() {
  #patch -p3 -d $srcdir/$pkgname < linpsk-1.1-compile-fix.patch
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt4 linpsk.pro
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/share/$pkgname/doc
  cd "$srcdir/$pkgname-$pkgver/bin"
  install -Dm755 linpsk $pkgdir/usr/bin/linpsk
  cd "$srcdir/$pkgname-$pkgver"
  install -m 0644 asoundrc $pkgdir/usr/share/$pkgname/doc/
  install -m 0644 COPYING $pkgdir/usr/share/$pkgname/doc/
  install -m 0644 README $pkgdir/usr/share/$pkgname/doc/

  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  cd $srcdir
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  cd "$srcdir/$pkgname-$pkgver/images"
  install -Dm644  $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

# vim:set ts=2 sw=2 et:
