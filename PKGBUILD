# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-image-epeg
pkgver=0.13
pkgrel=1
pkgdesc='Thumbnail jpegs at lightning speed (via MetaCPAN distribution)'
_dist=Image-Epeg
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/$_dist-$pkgver.tar.gz")
sha256sums=(d700d0e54799e162839652b6e9e91dbd8bb666e1f374faca901bb017e2541532)

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

