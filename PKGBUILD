# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-lingua-en-tagger'
pkgver='0.31'
pkgrel='1'
pkgdesc="Part-of-speech tagger for English natural language processing."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-html-tagset' 'perl-lingua-stem' 'perl-memoize-expirelru' 'perl')
makedepends=()
url='https://metacpan.org/release/Lingua-EN-Tagger'
source=('http://search.cpan.org/CPAN/authors/id/A/AC/ACOBURN/Lingua-EN-Tagger-0.31.tar.gz')
md5sums=('2046184b9b33ec5ae4b090b0941e8986')
_distdir="Lingua-EN-Tagger-0.31"

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
