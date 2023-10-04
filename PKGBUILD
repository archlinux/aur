# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-session-token
pkgver=1.503
pkgrel=1
pkgdesc='Secure, efficient, simple random session token generation (From MetaCPAN distribution)'
_dist=Session-Token
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/F/FR/FRACTAL/$_dist-$pkgver.tar.gz")
sha256sums=(32c3df96ef455c71870363acd950ddc4fbc848c594f4bc55b21b44cf979f79a1)

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
