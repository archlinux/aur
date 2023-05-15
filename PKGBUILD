# Maintainer: John Regan <john@jrjrtech.com>
pkgname=perl-future-http
pkgver=0.15
pkgrel=1
pkgdesc='Future::HTTP - provide the most appropriate HTTP client with a Future API'
_dist=Future-HTTP
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-filter-signatures' 'perl-moo' 'perl-future' 'perl-http-message')
makedepends=('perl-test-http-localserver')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CO/CORION/${_dist}-${pkgver}.tar.gz")
md5sums=('986fb0d732d8be2164d3c53d77ffc2a4')

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

