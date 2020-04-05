# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Prometheus-Tiny-Shared'
_modnamespace=Prometheus
pkgname=perl-prometheus-tiny-shared
pkgver=0.020
pkgrel=1
pkgdesc="A tiny Prometheus client backed by a shared memory region"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-cache-fastmmap' 'perl-dbd-sqlite' 'perl-dbi' 'perl-hash-sharedmem' 'perl-json-xs' 'perl-prometheus-tiny' 'perl-sereal')
checkdepends=('perl-data-random' 'perl-plack' 'perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('b97da68d930d6a79ee244c978e810c270937d00e45de27a1c7af6dbc0d3c2e8d')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
