# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sql-abstract'
pkgver='1.84'
pkgrel='1'
pkgdesc="Generate SQL from Perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hash-merge>=0.12' 'perl-moo>=2.000001' 'perl-mro-compat>=0.12' 'perl-sub-quote>=2.000001')
makedepends=('perl-test-deep>=0.101' 'perl-test-exception>=0.31' 'perl-test-warn')
url='http://search.cpan.org/dist/SQL-Abstract'
source=("https://cpan.metacpan.org/authors/id/I/IL/ILMARI/SQL-Abstract-${pkgver}.tar.gz")
md5sums=('9c76c34edff83ccc6f3c51a67aa18d61')
sha512sums=('2d41ca76cc50dcf85e40b6585b3036ae62801ce78b64cc3b6a6471540901bfacdbfe2f76e68fdea2d1caa509f57216d4bb4f214cee7008380d5f60643e1a3a6b')

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
