# Maintainer: John Regan <john@jrjrtech.com>
pkgname=perl-filter-signatures
pkgver=0.19
pkgrel=1
pkgdesc='Filter::signatures'
_dist=Filter-signatures
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-filter-simple')
makedepends=()
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CO/CORION/${_dist}-${pkgver}.tar.gz")
md5sums=('cc2ac46700ed0dd4989e7fd74d11312b')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

