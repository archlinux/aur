# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-callback-frame
pkgver=1.102
pkgrel=1
pkgdesc='Preserve error handlers and "local" variables across callbacks'
_dist=Callback-Frame
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-guard')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/F/FR/FRACTAL/$_dist-$pkgver.tar.gz")
sha256sums=(e8a47c7cf04cea2fee5802deec79d6abc548cf4a199a66a251c8bf5d08dfe9c0)
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

