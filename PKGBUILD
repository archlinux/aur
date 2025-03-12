# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-mime-encwords'
pkgver='1.015.0'
pkgrel='3'
pkgdesc="deal with RFC 2047 encoded words (improved)"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-mime-charset>=1.10.1' 'perl')
url='https://metacpan.org/pod/MIME::EncWords'
source=("https://cpan.metacpan.org/authors/id/N/NE/NEZUMI/MIME-EncWords-${pkgver}.tar.gz")
sha512sums=('21331a5c45b84f0840d8383a7b049509d565b19c62dd4a2e4abe6e16fe8308716f65b93168fa5884b1886981a15869cd26628c34d2d5588d0212550963f905c7')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/MIME-EncWords-${pkgver}"
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
