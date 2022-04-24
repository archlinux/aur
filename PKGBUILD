# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-sub-exporter-formethods'
pkgver='0.100054'
pkgrel='1'
pkgdesc="helper routines for using Sub::Exporter to build methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter')
checkdepends=('perl-namespace-autoclean')
url='https://metacpan.org/release/Sub-Exporter-ForMethods'
source=('https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Exporter-ForMethods-0.100054.tar.gz')
sha256sums=('eef61c9421688bb3a7beaca71623df11c8a749307ae428abdabc556e2bfafc3e')
_distdir="Sub-Exporter-ForMethods-0.100054"

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
