# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-devel-repl'
pkgver='1.003028'
pkgrel='3'
pkgdesc="a modern perl interactive shell"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-homedir' 'perl-module-runtime' 'perl-moose>=0.93' 'perl-moosex-getopt>=0.72' 'perl-moosex-object-pluggable>=0.0009' 'perl-namespace-autoclean' 'perl-task-weaken')
makedepends=('perl-test-fatal')
url='http://search.cpan.org/dist/Devel-REPL/'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Devel-REPL-${pkgver}.tar.gz")
sha512sums=('f3eab967fc5502cdb66a601a20ef83561cf285c19c0634d77d0a037416874b0d8faeb0f840fff7d943c3c43dfed4eca0c8afd56f82a69065938f5b872f58fe7e')

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
