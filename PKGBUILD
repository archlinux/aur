# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-encode-imaputf7"
pkgver="1.05"
pkgrel="1"
pkgdesc="Modification of UTF-7 encoding for IMAP"
arch=('any')
url="http://search.cpan.org/dist/Encode-IMAPUTF7"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PM/PMAKHOLM/Encode-IMAPUTF7-${pkgver}.tar.gz")
sha512sums=('e286e059db72c498173a312223152ca492700282345cccbd21ea49e0334fedcd922ae40b018aa8a6b474a10fbff9ac49f46d4c6f9920f3e508adab42bdca976f')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Encode-IMAPUTF7-${pkgver}"
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
