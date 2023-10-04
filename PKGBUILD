# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-plack-middleware-csrfblock
pkgver=0.10
pkgrel=1
pkgdesc='Block CSRF Attacks with minimal changes to your app'
_dist=Plack-Middleware-CSRFBlock
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-digest-sha1' 'perl-html-parser' 'perl-plack')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/M/MA/MATTP/$_dist-$pkgver.tar.gz")
sha256sums=(eb5ba4f4b391236d9c16111917db5905bac2c02bec93908850b97aa72fa31d3f)

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
