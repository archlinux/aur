# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sql-abstract'
pkgver='1.82'
pkgrel='1'
pkgdesc="Generate SQL from Perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hash-merge>=0.12' 'perl-moo>=2.000001' 'perl-mro-compat>=0.12' 'perl-sub-quote>=2.000001')
makedepends=('perl-test-deep>=0.101' 'perl-test-exception>=0.31' 'perl-test-warn')
url='http://search.cpan.org/dist/SQL-Abstract'
source=("https://cpan.metacpan.org/authors/id/I/IL/ILMARI/SQL-Abstract-${pkgver}.tar.gz")
md5sums=('1d7b0dd6bc9dc9348b672a1b5e08bc43')
sha512sums=('7262c8bccd1ddf6287a17a40e1c7566df8614480a2212871817ca07a2fff381861d19fdae414762a5ef17527af6b37c10161b276654d717574d4ade9b6c81ca7')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/SQL-Abstract-${pkgver}"
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
