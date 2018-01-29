# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-email-stuffer"
pkgver="0.016"
pkgrel="1"
pkgdesc="A more casual approach to creating and sending emails"
arch=('any')
url="http://search.cpan.org/dist/Email-Stuffer"
license=('PerlArtistic')
depends=('perl-email-mime>=1.943' 'perl-email-sender' 'perl-module-runtime' 'perl-params-util>=1.05' 'perl-scalar-list-utils')
makedepends=('perl-email-sender>=0.120000' 'perl-moo' 'perl-test-fatal')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Stuffer-${pkgver}.tar.gz")
sha512sums=('61ce86b245c2d43b6211f35ec02e62573239e8ad0e629b3b7fd779bec51f10961345611432a7694e52144fc3737f6a507da3ad65a1575d466d6ba9b6fee9047b')

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
