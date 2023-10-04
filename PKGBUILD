# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-anyevent-websocket-client
pkgver=0.55
pkgrel=1
pkgdesc='WebSocket client, connection and message for AnyEvent (via MetaCPAN distribution)'
_dist=AnyEvent-WebSocket-Client
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-anyevent-connector' 'perl-moo' 'perl-perlx-maybe' 'perl-protocol-websocket' 'perl-uri-ws' 'perl-ev')
makedepends=('perl-test-memory-cycle')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_dist-$pkgver.tar.gz")
sha256sums=(55cf0ea6f93f8f4932ead5f9a89b027642ed60381a93528411c7e9331dd4c025)

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
