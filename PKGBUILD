# Maintainer: TDY <tdy@gmx.com>

pkgname=perl-x11-keyboard
pkgver=1.4
pkgrel=2
pkgdesc="Perl keyboard support functions for X11"
arch=('any')
url="http://search.cpan.org/dist/X11-Keyboard/"
license=('MIT')
depends=('perl-x11-protocol')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/E/EC/ECALDER/X11-Keyboard-$pkgver.tar.gz
        LICENSE)
md5sums=('6e41bc24bac68acf200667343f916248'
         '42a48808c1b33b5f44ce74e3baed856c')

build() {
  cd "$srcdir/X11-Keyboard-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package() {
  cd "$srcdir/X11-Keyboard-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
