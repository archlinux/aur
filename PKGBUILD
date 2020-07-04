# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-email-stuffer"
pkgver="0.018"
pkgrel="1"
pkgdesc="A more casual approach to creating and sending emails"
arch=('any')
url="https://metacpan.org/pod/Email::Stuffer"
license=('PerlArtistic')
depends=('perl-email-mime>=1.943' 'perl-email-sender' 'perl-module-runtime' 'perl-params-util>=1.05' 'perl-scalar-list-utils')
makedepends=('perl-email-sender>=0.120000' 'perl-moo' 'perl-test-fatal')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Stuffer-${pkgver}.tar.gz")
sha512sums=('8a68efaae39392ecffebbe580349aedc14043f5bb9b5f1e81a6cc3981ec8378fc5937a8c157d593ca110fe8b49873171cb269a4de0f3095d8e0ace6f862e4820')

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
