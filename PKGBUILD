# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-mason
pkgver=2.24
pkgrel=2
pkgdesc='Powerful, high-performance templating for the web and beyond (via MetaCPAN distribution)'
_dist=Mason
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-capture-tiny' 'perl-class-load' 'perl-class-unload' 'perl-devel-globaldestruction' 'perl-exception-class' 'perl-pathtools' 'perl-guard' 'perl-ipc-system-simple' 'perl-json' 'perl-log-any' 'perl-method-signatures-simple' 'perl-moose' 'perl-moosex-strictconstructor' 'perl-moosex-hasdefaults' 'perl-scalar-list-utils' 'perl-try-tiny')
makedepends=('perl-test-class-most' 'perl-test-longstring')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSWARTZ/$_dist-$pkgver.tar.gz")
sha256sums=(ac820e75ad3c90d2a850a4ed062690308a014910e918b0018808e9c58f7e1f21)

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

