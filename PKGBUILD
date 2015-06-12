# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=perl-gtk2-sourceview2
_cpanname=Gtk2-SourceView2
pkgver=0.10
pkgrel=4
pkgdesc="Perl interface to the GtkSourceView library"
arch=('any')
url="http://search.cpan.org/~POTYL/${_cpanname}"
license=('GPL')
depends=('gtksourceview2' 'pango-perl' 'gtk2-perl' 'perl-extutils-depends' 'perl-extutils-pkgconfig')
options=('!emptydirs')
source=(http://cpan.metacpan.org/authors/id/P/PO/POTYL/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('87e81e182fe013bb445f211e5e407029')

build() {
  cd $srcdir/${_cpanname}-${pkgver}
  sed -i '/^auto_install/d' Makefile.PL
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
