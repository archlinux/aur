# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-email-stuffer"
pkgver="0.014"
pkgrel="1"
pkgdesc="A more casual approach to creating and sending emails"
arch=('any')
url="http://search.cpan.org/dist/Email-Stuffer"
license=('PerlArtistic')
depends=('perl' 'perl-email-mime>=1.920' 'perl-email-sender' 'perl-params-util>=1.05')
makedepends=('perl-moo' 'perl-test-pod>=1.41')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Stuffer-${pkgver}.tar.gz")
sha512sums=('93abda5a306ae22e3c0e0682d983d48945805662a83ef7cd717a38a59d38f11a277ad000b1182901f9c8145ff4fba852be2da3253cfa090f5c6f747426bd0bd3')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
