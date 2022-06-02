# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-text-balanced'
pkgver='2.05'
pkgrel='1'
pkgdesc="Extract delimited text sequences from strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Text-Balanced'
source=('https://cpan.metacpan.org/authors/id/S/SH/SHAY/Text-Balanced-2.05.tar.gz')
sha256sums=('3a6f3fbcc6cb5406964b2e332688bae3c2595436d03ddb25ee6703a47a98977d')
_distdir="Text-Balanced-2.05"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}