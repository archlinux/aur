# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-anynum'
pkgver='0.39'
pkgrel='1'
pkgdesc="Math::AnyNum - arbitrary size precision for integers, rationals, floating-points and complex numbers."
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-math-gmpq>=0.45' 'perl-math-gmpz>=0.39' 'perl-math-mpc>=1.07' 'perl-math-mpfr>=3.29')
makedepends=()
url='https://metacpan.org/release/Math-AnyNum'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Math-AnyNum-${pkgver}.tar.gz")
b2sums=('8a875175a6db0da2229c776286865a8aad04b382dcbb1c13fe2b0195ddc592309e4e1c0f0ba6c007588bb960fbdd8297dcfc5025a0f4875f666b9a366cc1020d')
_distdir="Math-AnyNum-${pkgver}"

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
  rm -r "$pkgdir/usr/lib"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
