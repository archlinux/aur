# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-devel-repl'
pkgver='1.003029'
pkgrel='2'
pkgdesc="a modern perl interactive shell"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  'perl'

  # main runtime requirements
  'perl-file-homedir'
  'perl-module-runtime'
  'perl-moose>=0.93'
  'perl-moosex-getopt>=0.18'
  'perl-moosex-object-pluggable>=0.0009'
  'perl-namespace-autoclean'
  'perl-scalar-list-utils'
  'perl-task-weaken'

  # runtime requirements for modules
  'perl-b-keywords'
  'perl-data-dump-streamer'
  'perl-data-dumper-concise'
  'perl-file-next'
  'perl-lexical-persistence'
  'perl-module-refresh'
  'perl-ppi'
  'perl-ppi-xs'
  'perl-sys-sigaction'
)
makedepends=(
  'perl-test-fatal'
)
url='http://search.cpan.org/dist/Devel-REPL/'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Devel-REPL-${pkgver}.tar.gz")
sha512sums=('08aeaa94e088051506f0912fb4d51585f6c73107fce54ef590706dba0cb9b04ea65ceb64e1bbf0b8c409a6aeb3d5e4e044d19277f41ba5b8e3b9459bb5dbf1c4')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
