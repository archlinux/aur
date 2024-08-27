# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-system-info
pkgver=0.065
pkgrel=1
pkgdesc='Perl module to get basic information about the system'
_dist=System-Info
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-warnings')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/$_dist-$pkgver.tgz")
sha256sums=(61f9b0c805daf4ed3b7965f4a7a321e448442d1b4fa465222338e93884e0ceb7)
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

