# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=perl-image-pnm
pkgver=0.01
pkgrel=1
pkgdesc='parse and generate PNM (PBM, PGM, PPM) files'
_dist=Image-PNM
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('MIT')
depends=(perl)
options=('!emptydirs' purge)
source=("https://search.cpan.org/CPAN/authors/id/D/DO/DOY/$_dist-$pkgver.tar.gz")
sha256sums=('cb03f33bfbbe1d2a6875c18beae2bcd71ad0c9996fee51df5fa3f93ad30a87fa')

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

