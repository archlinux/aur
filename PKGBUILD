# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-algorithm-checkdigits"
pkgver="1.3.2"
pkgrel='2'
pkgdesc="Perl extension to generate and test check digits"
arch=('any')
url="http://search.cpan.org/dist/Algorithm-CheckDigits/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-module-build' 'perl-probe-perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MAMAWE/Algorithm-CheckDigits-v${pkgver}.tar.gz")
sha512sums=('f55f9f8244e287d9fe8519688a543517260063655625c2de0646ae9e29663f8d08c6b2c7897b4c62f0dd132334a488b06f417b096b05db4550446f95bc73d26e')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
