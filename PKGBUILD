# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-anyevent-connector
pkgver=0.04
pkgrel=1
pkgdesc='tcp_connect with transparent proxy handling (via MetaCPAN distribution)'
_dist=AnyEvent-Connector
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-anyevent' 'perl-uri')
makedepends=('perl-module-build' 'perl-module-build-prereqs-fromcpanfile')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/T/TO/TOSHIOITO/$_dist-$pkgver.tar.gz")
sha256sums=(a8c4a96ca72f400b5c241b0e61cae02b4a7490eded8ef737f16f1cb7ac931d44)

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
