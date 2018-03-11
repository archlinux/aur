# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-email-stuffer"
pkgver="0.017"
pkgrel="1"
pkgdesc="A more casual approach to creating and sending emails"
arch=('any')
url="http://search.cpan.org/dist/Email-Stuffer"
license=('PerlArtistic')
depends=('perl-email-mime>=1.943' 'perl-email-sender' 'perl-module-runtime' 'perl-params-util>=1.05' 'perl-scalar-list-utils')
makedepends=('perl-email-sender>=0.120000' 'perl-moo' 'perl-test-fatal')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Stuffer-${pkgver}.tar.gz")
sha512sums=('805ce18d19db4ac64344f3985a1d3140d58af2b9311ef26bc84e586711a957f6ee31578177e500568fd7dea97fd67ad23772a5e4297a13de997dac1a5a626221')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Email-Stuffer-${pkgver}"
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
  find "$pkgdir" '(' -name .packlist -o -name perllocal.pod ')' -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
