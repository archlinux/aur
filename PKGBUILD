# Maintainer: John Regan <john@jrjrtech.com>
pkgname=perl-net-async-websocket
pkgver=0.13
pkgrel=2
pkgdesc='Perl Net::Async::WebSocket CPAN module'
_dist=Net-Async-WebSocket
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-io-async' 'perl-protocol-websocket')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_dist}-${pkgver}.tar.gz")
md5sums=('3b4bd23e760bd944a9e79e5a0be7773e')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}

