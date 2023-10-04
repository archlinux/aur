# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-plack-middleware-profiler-nytprof
pkgver=0.17
pkgrel=1
pkgdesc='Middleware for Profiling a Plack App'
_dist=Plack-Middleware-Profiler-NYTProf
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-devel-nytprof' 'perl-plack' 'perl-file-which')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/K/KI/KITANO/$_dist-$pkgver.tar.gz")
sha256sums=(601f0c0d4e5ee562811e19a8a469900d674b85f1e6263a1b56e1af3748d9e04b)

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
