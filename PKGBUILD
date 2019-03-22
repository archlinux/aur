# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-log-dispatch-file-stamped"
pkgver="0.19"
pkgrel='1'
pkgdesc="Logging to date/time stamped files"
arch=('any')
url="https://metacpan.org/pod/Log::Dispatch::File::Stamped"
license=('PerlArtistic')
depends=('perl-log-dispatch')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Log-Dispatch-File-Stamped-${pkgver}.tar.gz")
sha512sums=('b6988998e98dc210821af4b9c15948fa1b25711c8a01bbcf7b9c0b7c1e698c940c14458be9585743845b44aae24b25f1c570e2630b33bd656a932f2836994f94')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Log-Dispatch-File-Stamped-${pkgver}"
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
