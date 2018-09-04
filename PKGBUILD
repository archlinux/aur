# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Number-Fraction
cpanauthor=DAVECROSS
pkgname='perl-number-fraction'
pkgver=2.01
pkgrel=1
pkgdesc="model fractions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    perl
    perl-moose
)
checkdepends=(
    perl-test-pod
    perl-test-pod-coverage
)
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('3552a2736a133a0cb642b28ee9e7c229')
sha256sums=('0585a871cb5243fdb4c8b4b0bcd1f61d431bc4da11f907d82fe9d7465a2d5bfb')
sha512sums=('89a5dc9f3cd36ab1abffb3c4e3660b576cb7760fb00e5ffef3256014e0fd210be5f5fdeb339484ed20e36d090500919a58242e7739d3f52ba0fd692a1141e4d3')

build() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
