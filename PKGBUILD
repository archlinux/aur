# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-algorithm-checkdigits"
pkgver="1.3.3"
pkgrel='1'
pkgdesc="Perl extension to generate and test check digits"
arch=('any')
url="https://metacpan.org/release/Algorithm-CheckDigits"
license=('GPL' 'PerlArtistic')
depends=('perl-module-build' 'perl-probe-perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MAMAWE/Algorithm-CheckDigits-v${pkgver}.tar.gz")
sha512sums=('2c137ce90cc0587d681084f3694554272263f805413af1269a3829669f780cccf79dfb45d52de621c182d49589cb74f9158161fbe026227527ab275ba1af5eab')

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
