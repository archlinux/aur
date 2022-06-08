pkgname='perl-http-request-params'
pkgver='1.02'
pkgrel='1'
pkgdesc="Retrieve GET/POST Parameters from HTTP Requests"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-http-message' 'perl-cgi' 'perl-email-mime')
url='https://metacpan.org/pod/HTTP::Request::Params'
source=('https://cpan.metacpan.org/authors/id/K/KI/KIZ/HTTP-Request-Params-1.02.tar.gz')
sha256sums=('9c12880ae20bda79366a89cab05eca53d728d94e5e99e988763effc013e8ee8c')
_distdir="HTTP-Request-Params-1.02"

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
