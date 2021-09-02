# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Prometheus-Tiny-Shared'
_modnamespace=Prometheus
pkgname=perl-prometheus-tiny-shared
pkgver=0.024
pkgrel=1
pkgdesc="A tiny Prometheus client backed by a shared memory region"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-cache-fastmmap' 'perl-dbd-sqlite' 'perl-dbi' 'perl-hash-sharedmem' 'perl-json-xs' 'perl-prometheus-tiny' 'perl-sereal')
checkdepends=('perl-data-random' 'perl-plack' 'perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('8fbc543e0bfd5d8f73bdc121a2dacafd4344aeea4b99b715c50dcdaa4826820b')

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
