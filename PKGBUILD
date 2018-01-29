# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sql-abstract'
pkgver='1.85'
pkgrel='1'
pkgdesc="Generate SQL from Perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hash-merge>=0.12' 'perl-moo>=2.000001' 'perl-mro-compat>=0.12' 'perl-scalar-list-utils' 'perl-sub-quote>=2.000001')
makedepends=('perl-test-deep>=0.101' 'perl-test-exception>=0.31' 'perl-test-warn')
url='http://search.cpan.org/dist/SQL-Abstract'
source=("https://cpan.metacpan.org/authors/id/I/IL/ILMARI/SQL-Abstract-${pkgver}.tar.gz")
md5sums=('ab00dcadae5836c7e0acb4d65a12aa05')
sha512sums=('1ca6e22dfe8a9e4cedb6e872ebbd87ecb12cac1f1998083946028882ea408557d1be78f9dccf7ac1b7fe25b75b3fbaa9db17b1e65a1b7e7470243d4da3127393')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
