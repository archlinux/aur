# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-dbix-class'
pkgver='0.082820'
pkgrel='1'
pkgdesc="Extensible and flexible object <-> relational mapper."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  'perl'
  'perl-class-accessor-grouped>=0.10012'
  'perl-class-c3-componentised>=1.0009'
  'perl-class-inspector>=1.24'
  'perl-config-any>=0.20'
  'perl-context-preserve>=0.01'
  'perl-data-dumper-concise>=2.020'
  'perl-data-page>=2.00'
  'perl-dbi>=1.57'
  'perl-devel-globaldestruction>=0.09'
  'perl-hash-merge>=0.12'
  'perl-module-find>=0.07'
  'perl-moo>=1.006001'
  'perl-mro-compat>=0.12'
  'perl-namespace-clean>=0.24'
  'perl-path-class>=0.18'
  'perl-scope-guard>=0.03'
  'perl-sql-abstract>=1.81'
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
url='http://search.cpan.org/dist/DBIx-Class'
source=("https://cpan.metacpan.org/authors/id/R/RI/RIBASUSHI/DBIx-Class-${pkgver}.tar.gz")
md5sums=('f2e67a7e46509f5224f14082068322e7')
sha512sums=('16b2176d0a31689163516767e693399dfa185a1d296f5e494b6a782d67420a4ebf21d43ac414f6dbdfce3d72966a91cb0eea1dba24d00617b5bb553df873234a')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
