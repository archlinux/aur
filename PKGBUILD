# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-email-filter"
pkgver="1.034"
pkgrel='2'
pkgdesc="Library for creating easy email filters"
arch=('any')
url="http://search.cpan.org/dist/Email-Filter/"
license=('PerlArtistic')
depends=('perl-class-trigger' 'perl-email-simple' 'perl-email-localdelivery' 'perl-ipc-run')
makedepends=('perl-test-pod>=1.41')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Filter-${pkgver}.tar.gz")
sha512sums=('8b377c3d7503f18f03c8bd97baed17a5615c41cf737886aa834aa324954531a464b2564be244c4097fb9d5fe1b612885303acbf1d7dc8b2a64a739fb81ef3af6')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Email-Filter-${pkgver}"
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
