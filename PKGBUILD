# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-test-class-most
pkgver=0.08
pkgrel=1
pkgdesc='Test Classes the easy way (via MetaCPAN distribution)'
_dist=Test-Class-Most
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-test-class' 'perl-test-most')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/O/OV/OVID/$_dist-$pkgver.tar.gz")
sha256sums=(634cded86bba5dde07ced72ffb8a46705ff93aa844b98e96bde05540234c7dff)

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

