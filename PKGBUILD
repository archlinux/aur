# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sql-abstract'
pkgver='1.86'
pkgrel='1'
pkgdesc="Generate SQL from Perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hash-merge>=0.12' 'perl-moo>=2.000001' 'perl-mro-compat>=0.12' 'perl-scalar-list-utils' 'perl-sub-quote>=2.000001')
makedepends=('perl-test-deep>=0.101' 'perl-test-exception>=0.31' 'perl-test-warn')
url='http://search.cpan.org/dist/SQL-Abstract'
source=("https://cpan.metacpan.org/authors/id/I/IL/ILMARI/SQL-Abstract-${pkgver}.tar.gz")
md5sums=('d4540f32a01cc8591dea8dc373e30f27')
sha512sums=('248652656bebf9e3f3e2582880f78f4f8c6dd2a8e2546a750b33e9d95cd6da6d8a197d0be69b5e44a24e04c8e1262d4bf3085fa95405fa28eefc3b822a93fa42')

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
