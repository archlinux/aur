# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-dbix-class'
pkgver='0.082844'
pkgrel='3'
pkgdesc="Extensible and flexible object <-> relational mapper."
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')

depends=(
  'perl'
  'perl-class-accessor-grouped>=0.10012'
  'perl-class-c3-componentised>=1.0009'
  'perl-class-inspector>=1.24'
  'perl-config-any>=0.20'
  'perl-context-preserve>=0.01'
  'perl-data-dumper-concise>=2.020'
  'perl-dbi>=1.57'
  'perl-devel-globaldestruction>=0.09'
  'perl-hash-merge>=0.12'
  'perl-module-find>=0.07'
  'perl-moo>=2.000'
  'perl-mro-compat>=0.12'
  'perl-namespace-clean>=0.24'
  'perl-path-class>=0.18'
  'perl-scope-guard>=0.03'
  'perl-sql-abstract-classic>=1.91'
  'perl-sub-name>=0.04'
  'perl-try-tiny>=0.07'
)

makedepends=(
  'perl-dbd-sqlite>=1.29'
  'perl-package-stash>=0.28'
  'perl-test-deep>=0.101'
  'perl-test-exception>=0.31'
  'perl-test-warn>=0.21'
)
url='https://metacpan.org/dist/DBIx-Class'
source=("https://cpan.metacpan.org/authors/id/R/RI/RIBASUSHI/DBIx-Class-${pkgver}.tar.gz")
sha512sums=('b795a6a841da8e3a984af4f8305ba0f628d0839cf398002ad0a9f8ca9fa22d7720cd936523489f83199aa598d6959da94ad072063a92cac29fd1e3d89600ca8e')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/DBIx-Class-${pkgver}"
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
  find "$pkgdir" "(" -name .packlist -o -name "*.pod" ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
