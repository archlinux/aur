# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-lingua-stem'
pkgver='2.31'
pkgrel='1'
pkgdesc="Stemming of words in various languages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-pt-stemmer' 'perl-lingua-stem-fr' 'perl-lingua-stem-it' 'perl-lingua-stem-ru' 'perl-lingua-stem-snowball-da' 'perl-snowball-norwegian' 'perl-snowball-swedish' 'perl-text-german')
checkdepends=('perl-test-distribution')
url='http://search.cpan.org/dist/Lingua-Stem'
source=('http://search.cpan.org/CPAN/authors/id/S/SN/SNOWHARE/Lingua-Stem-2.31.tar.gz')
md5sums=('8603031c938cfd75266a18da132d33c4')
_distdir="Lingua-Stem-2.31"

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
