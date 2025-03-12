# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-log-dispatch-file-stamped"
pkgver="0.21"
pkgrel='3'
pkgdesc="Logging to date/time stamped files"
arch=('any')
url="https://metacpan.org/pod/Log::Dispatch::File::Stamped"
license=('Artistic-2.0' 'GPL-1.0-or-later')
depends=('perl-log-dispatch' 'perl-namespace-clean>=0.19' 'perl-params-validationcompiler' 'perl-specio>=0.48')
makedepends=('perl-path-tiny' 'perl-test-deep' 'perl-test-fatal')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Log-Dispatch-File-Stamped-${pkgver}.tar.gz")
sha512sums=('c8d7b141f559c630ec6e600013c216d882b0fdc56913d4fc01871b72bb92d561b930356dc0209d4cf66eb7f2123a165eaa8d826b5d133d67ac18e15cf57fb7bc')

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
