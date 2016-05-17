# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-algorithm-checkdigits"
pkgver="1.3.1"
pkgrel="1"
pkgdesc="Perl extension to generate and test check digits"
arch=('any')
url="http://search.cpan.org/dist/Algorithm-CheckDigits/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-module-build' 'perl-probe-perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MAMAWE/Algorithm-CheckDigits-v${pkgver}.tar.gz")
sha512sums=('c877a84f16768dd890304d32c196dc66449609db6d59b1fe4f633a0edf969952854e4dce6b510d90a57750d6a2c0710450a8765e3f47ac4eeedf12d5a6156596')

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
