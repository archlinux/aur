pkgname=perl-json-rpc
pkgver=1.06
pkgrel=2
pkgdesc="Perl implementation of JSON-RPC 1.1 protocol"
arch=('i686' 'x86_64')
conflicts=('perl-json-rpc-legacy')
url='http://search.cpan.org/dist/JSON-RPC'
license=('GPL' 'PerlArtistic')
depends=('perl'
         'perl-libwww'
         'perl-plack'
         'perl-router-simple'
         'perl-json'
         'perl-cgi'
         )
checkdepends=('perl-test-pod')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DM/DMAKI/JSON-RPC-${pkgver}.tar.gz")
sha1sums=('d3288e5475c2fae5c7ed7fd5e547dd26a1fd07cd')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "JSON-RPC-${pkgver}"
    /usr/bin/perl Build.PL
    ./Build
  )
}


check() {
  cd "JSON-RPC-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    ./Build test
  )
}

package() {
  cd "JSON-RPC-${pkgver}"
  ./Build install

  find "${pkgdir}" -name '.packlist' -o -name 'perllocal.pod' -delete
}

