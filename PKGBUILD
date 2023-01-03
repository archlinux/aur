# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-string-flogger'
pkgver='1.101246'
pkgrel='1'
pkgdesc="string munging for loggers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-maybexs' 'perl-params-util' 'perl-sub-exporter')
url='https://metacpan.org/release/String-Flogger'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/String-Flogger-1.101246.tar.gz')
md5sums=('7ec46873fa6964cf0ec5e59f3f152c72')
_distdir="String-Flogger-1.101246"

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
