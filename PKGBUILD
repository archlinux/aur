# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-lingua-en-inflect-phrase'
pkgver='0.20'
pkgrel='1'
pkgdesc="Inflect short English Phrases"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-en-findnumber' 'perl-lingua-en-inflect' 'perl-lingua-en-inflect-number' 'perl-lingua-en-number-isordinal' 'perl-lingua-en-tagger')
makedepends=('perl-test-nowarnings')
url='http://search.cpan.org/dist/Lingua-EN-Inflect-Phrase'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/Lingua-EN-Inflect-Phrase-0.20.tar.gz')
md5sums=('cbb7861033f3a7076854ad015949c86f')
_distdir="Lingua-EN-Inflect-Phrase-0.20"

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
