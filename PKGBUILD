# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-anyevent-websocket-server
pkgver=0.10
pkgrel=1
pkgdesc='WebSocket server for AnyEvent (via MetaCPAN distribution)'
_dist=AnyEvent-WebSocket-Server
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-anyevent' 'perl-anyevent-websocket-client' 'perl-protocol-websocket' 'perl-try-tiny')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/T/TO/TOSHIOITO/$_dist-$pkgver.tar.gz")
sha256sums=(a9b74b81b93fc953c0bc8d39def4900e8af3e1e1963f8b4db3ccbae3063f4052)

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
