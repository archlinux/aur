# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sql-abstract-classic'
pkgver='1.91'
pkgrel='2'
pkgdesc="Generate SQL from Perl data structures"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-mro-compat>=0.12' 'perl-sql-abstract>=1.79' 'perl-text-balanced>=2.00')
makedepends=('perl-test-deep>=0.101' 'perl-test-exception>=0.31' 'perl-test-warn')
url='https://metacpan.org/pod/SQL::Abstract::Classic'
source=("https://cpan.metacpan.org/authors/id/R/RI/RIBASUSHI/SQL-Abstract-Classic-${pkgver}.tar.gz")
sha512sums=('a2389c04889ea09fc6512f955f8a383d1f51839f584a0be16aab33dec72b67214d0f22d55c666fa0ddeaa32e5c6fc91e1e50541d52e71beeb3b3d85af21a9643')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/SQL-Abstract-Classic-${pkgver}"
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
