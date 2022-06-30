# Contributor: Olivier Duclos <olivier.duclos@gmail.com>
# Maintainer: Dan Panzarella <alsoelp@gmail.com>

pkgname=gbdfed
pkgver=1.6
pkgrel=4
pkgdesc="A GTK2 bitmap font editor"
arch=(i686 x86_64)
url="http://sofia.nmsu.edu/~mleisher/Software/gbdfed/"
license=('MIT')
depends=(gtk2)
source=(http://sofia.nmsu.edu/~mleisher/Software/gbdfed/$pkgname-$pkgver.tar.bz2 \
	http://sofia.nmsu.edu/~mleisher/Software/gbdfed/gbdfed48x48.png \
	gbdfed.desktop \
	num_signals.patch\
  format-security.patch)
md5sums=('2a2e1cbfe8566db6d302f0b9ab79b8dd'
         '3681abf22f23a62c48acfca417655dd0'
         '9e4dd5cb12245e7ea51f53085a714360'
         '0034b837f9217ebdf5a271d2e242d635'
         '2188364eb5d5eb694d86d28236de9db7')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/-D.*_DEPRECATED\s*\\*//' Makefile.in
  patch -p1 < ../num_signals.patch
  patch -p1 < ../format-security.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/{applications,pixmaps}
  install -m644 ../gbdfed.desktop $pkgdir/usr/share/applications/
  install -m644 ../gbdfed48x48.png $pkgdir/usr/share/pixmaps/gbdfed.png
}
