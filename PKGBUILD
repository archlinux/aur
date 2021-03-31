# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Elliott "Seylerius" Seyler <seylerius@publicinquisition.com>

pkgname='perl-net-websocket-server'
pkgver='0.004000'
pkgrel='1'
pkgdesc="A straightforward Perl WebSocket server with minimal dependencies. "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-protocol-websocket' 'perl' 'perl-yaml')
makedepends=()
url='https://metacpan.org/release/Net-WebSocket-Server'
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TOPAZ/Net-WebSocket-Server-$pkgver.tar.gz)
md5sums=('a8abd39a29b6d3e4200fe639888ae92a')
sha512sums=('b2a3fbff97010c618e52a58f7b4f54570690cc80187ac63a3cc0bef83c92c114f01f760f88a490ce6af5d41b71bd19c9dd30cad3f1d2321e5725ef250cf3f756')
_distdir=(Net-WebSocket-Server-$pkgver)

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
