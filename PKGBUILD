# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-alien-gnuplot
pkgver=1.042
pkgrel=2
pkgdesc="Find and verify functionality of the gnuplot executable."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-alien-build' 'gnuplot')
checkdepends=('perl-test-exception')
url='https://metacpan.org/dist/Alien-Gnuplot'
_distdir="Alien-Gnuplot"
source=("https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_distdir-$pkgver.tar.gz")
sha512sums=('45015982547ac21b8de83dd6ab125241929a6cefc4b38ac0463fdc7e0ffb3228b16aad681fa41bd288402c16659b9e4839ca106865bc6482a834dacbe4b3123b')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir-$pkgver"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
