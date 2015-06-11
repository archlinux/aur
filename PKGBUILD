# $Id: PKGBUILD 96760 2013-09-04 10:17:31Z spupykin $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=xlockmore-nomotif
_pkgname=xlockmore
pkgver=5.46
pkgrel=1
pkgdesc="screen saver / locker for the X Window System - no motif"
arch=(i686 x86_64)
license=('BSD')
depends=(gtk2 libxpm libxmu glu)
optdepends=('fortune-mod')
makedepends=(mesa)
provides=("$_pkgname")
conflicts=("$_pkgname")
url="http://www.tux.org/~bagleyd/xlockmore.html"
options=('!makeflags')
source=(http://www.tux.org/~bagleyd/xlock/xlockmore-$pkgver.tar.xz
	LICENSE)
md5sums=('068b9c2bfbcdd02461edbac4d729cd27'
         'a64afab4283f53972a6702c2e59850d7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --disable-setuid \
	      --enable-appdefaultdir=/usr/share/X11/app-defaults \
	      --enable-pam --with-gtk2 --without-esound --without-ftgl \
	      --without-motif --without-magick --without-rplay
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make xapploaddir="$pkgdir/usr/share/X11/app-defaults" \
       mandir="$pkgdir/usr/man/man1" \
       prefix="$pkgdir/usr" install
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/"
}
