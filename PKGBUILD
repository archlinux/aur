# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sql-abstract'
pkgver='2.000001'
pkgrel='2'
pkgdesc="Generate SQL from Perl data structures"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-hash-merge>=0.12' 'perl-moo>=2.000001' 'perl-mro-compat>=0.12' 'perl-scalar-list-utils' 'perl-sub-quote>=2.000001')
makedepends=('perl-data-dumper-concise' 'perl-test-deep>=0.101' 'perl-test-exception>=0.31' 'perl-test-warn')
url='https://metacpan.org/dist/SQL-Abstract'
source=("https://cpan.metacpan.org/authors/id/M/MS/MSTROUT/SQL-Abstract-${pkgver}.tar.gz")
md5sums=('0f03e68ac9be6e265908be196c2e0ba9')
sha512sums=('a4cae42a261b64ba7c44bf6cc196f135ab32e847352572aafccee04dfdd5fe83d8b7654702acd90908cd0e90f6730cfc4fcfa8ffa81d52de7a18e38a2d6ea5d8')

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
