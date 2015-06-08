pkgname=perl-json-rpc
pkgver=1.06
pkgrel=1
pkgdesc="Perl implementation of JSON-RPC 1.1 protocol"
arch=('i686' 'x86_64')
conflicts=('perl-json-rpc-legacy')
url="http://search.cpan.org/dist/JSON-RPC/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-libwww' 'perl-plack' 'perl-router-simple' 'perl-json')
checkdepends=('perl-test-pod')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/D/DM/DMAKI/JSON-RPC-${pkgver}.tar.gz")
sha1sums=('d3288e5475c2fae5c7ed7fd5e547dd26a1fd07cd')

build() {
  cd "JSON-RPC-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}


check() {
  cd "JSON-RPC-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "JSON-RPC-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="${pkgdir}"
  find "${pkgdir}" -name '.packlist' -o -name 'perllocal.pod' -delete
}

