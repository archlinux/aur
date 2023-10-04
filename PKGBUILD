# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-plack-app-websocket
pkgver=0.08
pkgrel=1
pkgdesc='WebSocket server as a PSGI application (via MetaCPAN distribution)'
_dist=Plack-App-WebSocket
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-anyevent-websocket-server' 'perl-devel-globaldestruction' 'perl-plack' 'perl-scalar-list-utils' 'perl-try-tiny')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/T/TO/TOSHIOITO/$_dist-$pkgver.tar.gz")
sha256sums=(1703869de90b20ee00e7cdf8d0a153fcfe9b3dbc89bf6a8f62554dabb06d969b)

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
