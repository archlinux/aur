# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-class-accessor-grouped'
pkgver='0.10012'
pkgrel='2'
pkgdesc="Lets you build groups of accessors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-module-runtime>=0.012')
makedepends=('perl-test-exception>=0.31')
url='http://search.cpan.org/dist/Class-Accessor-Grouped'
source=("http://cpan.metacpan.org/authors/id/R/RI/RIBASUSHI/Class-Accessor-Grouped-${pkgver}.tar.gz"
        "Class-Accessor-Grouped.diff")
sha512sums=('195c4b1f9897b50753231ab6c893987a3e49e6283713175d612843651428c8cb2eb791a5385e25607a1db189861811efade33f94ef33c36cd41624e793ca20d1'
            'cd4977dbc6993804f7246402b93ea3c6f89eeb9a8b1f6bca26785972529f5542020290fd0cb4b9864133780743c17cd4a20f6a6a21ad37274f9a4d86eb5d595b')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Class-Accessor-Grouped-${pkgver}"
}

build() {
  prepare_environment
  patch -p0 < "${srcdir}/${source[1]}"
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
