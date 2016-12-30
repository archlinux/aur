pkgname=perl-sub-quote
pkgver=2.003001
pkgrel=1
pkgdesc="Perl extension for easily overriding subroutines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-fatal>=0.010')
url='http://search.cpan.org/dist/Sub-Quote'
source=("http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Sub-Quote-$pkgver.tar.gz")
sha256sums=('9d471d8e13e7ce4793d5a5ec04a60fface14dd53be78dd94d228871915cfd1f9')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/Sub-Quote-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/Sub-Quote-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/Sub-Quote-$pkgver"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
