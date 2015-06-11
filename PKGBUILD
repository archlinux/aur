# Contributor: Christian Mauderer <oss@c-mauderer.de>
pkgname=perl-html-prettyprinter
pkgver=0.03
pkgrel=1
pkgdesc='HTML::PrettyPrinter - generate nice HTML files from HTML syntax trees.'
_dist=HTML-PrettyPrinter
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-html-parser perl-html-tree perl-html-tagset)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CL/CLMS/$_dist-$pkgver.tar.gz")
md5sums=('4d3f84ba4e35cb7fac863b828b7f2b68')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
