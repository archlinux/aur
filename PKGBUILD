# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-algorithm-checkdigits"
pkgver="1.3.5"
pkgrel='1'
pkgdesc="Perl extension to generate and test check digits"
arch=('any')
url="https://metacpan.org/release/Algorithm-CheckDigits"
license=('GPL' 'PerlArtistic')
depends=('perl-module-build' 'perl-probe-perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MAMAWE/Algorithm-CheckDigits-v${pkgver}.tar.gz")
sha512sums=('dca6a5a26656dcf7cee305fd791dcf8b81eb5b33cf97bc7e6675549225274bd265c0ce456eebed9d129aac0e39b368a9400438c37e204b6597fa33f95a4c3476')

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
