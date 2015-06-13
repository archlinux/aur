# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-devel-repl'
pkgver='1.003026'
pkgrel='1'
pkgdesc="a modern perl interactive shell"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-keywords' 'perl-data-dump-streamer' 'perl-file-homedir' 'perl-lexical-persistence' 'perl-module-runtime' 'perl-moose>=0.93' 'perl-moosex-getopt>=0.18' 'perl-moosex-object-pluggable>=0.0009' 'perl-namespace-autoclean' 'perl-ppi' 'perl-task-weaken')
makedepends=('perl-test-checkdeps>=0.007' 'perl-test-fatal')
url='http://search.cpan.org/dist/Devel-REPL/'
source=("http://cpan.metacpan.org/authors/id/E/ET/ETHER/Devel-REPL-${pkgver}.tar.gz")
md5sums=('2404861ed071ee7af1d4574d7a3b9b90')
sha512sums=('fed331dad01fcf890c01b8ca94117665db10a1c68a78248c99b2adbb56c9978c33e19af2abd5b1a7ca3533e01a2f6d4d54a13ab4d5b55dcf5937fd39998dde1e')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Devel-REPL-${pkgver}"
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
