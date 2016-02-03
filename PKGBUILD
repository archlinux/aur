# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-algorithm-checkdigits
pkgver=1.3.0
pkgrel="1"
pkgdesc="Perl extension to generate and test check digits"
arch=('any')
url="http://search.cpan.org/dist/Algorithm-CheckDigits/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-module-build' 'perl-probe-perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MAMAWE/Algorithm-CheckDigits-v${pkgver}.tar.gz")
sha512sums=('b271c02ed466b2ef3d5360036a72b84a92c39b2d116a2d4eb79f7b6802deb017d9536089099c98a29ba260bd30b7bd8fec658a194601731dc59ab78a00ed8634')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Algorithm-CheckDigits-v${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
