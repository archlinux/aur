# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sql-abstract'
pkgver='2.000000'
pkgrel='1'
pkgdesc="Generate SQL from Perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hash-merge>=0.12' 'perl-moo>=2.000001' 'perl-mro-compat>=0.12' 'perl-scalar-list-utils' 'perl-sub-quote>=2.000001')
makedepends=('perl-data-dumper-concise' 'perl-test-deep>=0.101' 'perl-test-exception>=0.31' 'perl-test-warn')
url='http://search.cpan.org/dist/SQL-Abstract'
source=("https://cpan.metacpan.org/authors/id/M/MS/MSTROUT/SQL-Abstract-${pkgver}.tar.gz")
md5sums=('cf6b2fe5608aeb65c5ef64e1bed3f0ca')
sha512sums=('c230fc7f5c51075984e66d012e4f9523aaf451b5e13d1ca6f7e1b59f1dfacc928630123a77987a1f1cfd8894c6fbd325e43a63aee99931f246f711f6ae328dc0')

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
