# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-moosex-types-perl'
pkgver='0.101344'
pkgrel='1'
pkgdesc="Moose types that check against Perl syntax"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moosex-types')
checkdepends=('perl-moose')
url='https://metacpan.org/dist/MooseX-Types-Perl'
source=(https://cpan.metacpan.org/authors/id/R/RJ/RJBS/MooseX-Types-Perl-$pkgver.tar.gz)
md5sums=('d4cdcae30d6cbc6c7dc66e01539eecc5')
_distdir="MooseX-Types-Perl-$pkgver"

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
