# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-plack-middleware-deflater
pkgver=0.12
pkgrel=1
pkgdesc='Compress response body with Gzip or Deflate'
_dist=Plack-Middleware-Deflater
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-plack')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/K/KA/KAZEBURO/$_dist-$pkgver.tar.gz")
sha256sums=(28da95e7da4c8b5591ac454509c92176cd0842960ce074fde30f9a1075dcc275)

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
