# Maintainer: John Regan <john@jrjrtech.com>
pkgname=perl-test-http-localserver
pkgver=0.74
pkgrel=2
pkgdesc='Test::HTTP::LocalServer - spawn a local HTTP server for testing'
_dist=Test-HTTP-LocalServer
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-http-message' 'perl-cgi' 'perl-http-request-ascgi' 'perl-http-daemon')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CO/CORION/${_dist}-${pkgver}.tar.gz")
md5sums=('602f834ef266181244a39f73b37ca69a')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

