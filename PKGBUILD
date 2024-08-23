# Maintainer: Strykar <strykar@hotmail.com>

pkgname=perl-influxdb-http
pkgver=0.04
pkgrel=1
pkgdesc='Perl client for the InfluxDB HTTP API'
_dist=InfluxDB-HTTP
arch=('any')
url="https://metacpan.org/pod/InfluxDB::HTTP"
license=('Artistic-1.0-Perl')
depends=('perl' 'perl-http-tiny' 'perl-json' 'perl-encode' 'perl-uri' 'perl-json-maybexs' 'perl-lwp-useragent-cached' 'perl-object-result')
makedepends=('perl-module-build')
source=("https://cpan.metacpan.org/authors/id/R/RA/RAPHI/${_dist}-${pkgver}.tar.gz")
sha256sums=('d5cbb9c8f56e071772c56526e6e0fcb41a6573b184b9900d348932df5fafe3e3')
options=('!emptydirs' 'purge')

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
