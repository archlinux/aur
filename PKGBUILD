# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-email-stuffer"
pkgver="0.020"
pkgrel='3'
pkgdesc="A more casual approach to creating and sending emails"
arch=('any')
url="https://metacpan.org/pod/Email::Stuffer"
license=('Artistic-2.0' 'GPL-1.0-or-later')
depends=('perl-email-mime>=1.943' 'perl-email-sender' 'perl-module-runtime' 'perl-params-util>=1.05' 'perl-scalar-list-utils')
makedepends=('perl-email-sender>=0.120000' 'perl-moo' 'perl-test-fatal')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Stuffer-${pkgver}.tar.gz")
sha512sums=('62de0ed98ae892dfa79a6c19b0ddc82f932e7edb048323633810aefef26eed41501a672457f22ecf22846836ca731bfb10e29e2b1295125bc9540bbf04b7e18f')

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
