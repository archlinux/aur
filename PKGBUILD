# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=perl-barcode-datamatrix
pkgver='0.10'
pkgrel='1'
pkgdesc="Perl module to generate data for Data Matrix barcodes"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=5.6.0' 'perl-moo')
makedepends=('perl-test-assertions' 'perl-test-pod-coverage' 'perl-module-install')
url='https://metacpan.org/pod/Barcode::DataMatrix'
source=("https://cpan.metacpan.org/authors/id/M/MS/MSTRAT/Barcode-DataMatrix-$pkgver.tar.gz")
sha512sums=('e2480faac134b4059b62c70f5c50002ccd4612c26362df2d22df15e2f6c376255730c746a80a614834ef0aa93765ab4cef97d8c41901f140a815e6542a727080')
_distdir="Barcode-DataMatrix-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
