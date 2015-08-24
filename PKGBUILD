# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-devel-repl'
pkgver='1.003027'
pkgrel='1'
pkgdesc="a modern perl interactive shell"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-keywords' 'perl-data-dump-streamer' 'perl-file-homedir' 'perl-lexical-persistence' 'perl-module-runtime' 'perl-moose>=0.93' 'perl-moosex-getopt>=0.18' 'perl-moosex-object-pluggable>=0.0009' 'perl-namespace-autoclean' 'perl-ppi' 'perl-task-weaken')
makedepends=('perl-test-checkdeps>=0.007' 'perl-test-fatal')
url='http://search.cpan.org/dist/Devel-REPL/'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Devel-REPL-${pkgver}.tar.gz")
md5sums=('c96d0562008549012a52c02edf05fdaa')
sha512sums=('6541b5b59b2fbadc1a5d6994ab653feae1f142531612c1efc36ced15bac2d9a356401f6737b8b3bb43e20af066382e134176ad28ec359e8de2ed2cb955c2d2aa')

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
