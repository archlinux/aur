# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-context-preserve'
pkgver='0.01'
pkgrel="4"
pkgdesc="run code after a subroutine call, preserving the context the subroutine would have seen if it were the last statement in the caller"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-exception' 'perl-test-use-ok')
url='http://search.cpan.org/dist/Context-Preserve'
source=('http://search.cpan.org/CPAN/authors/id/J/JR/JROCKWAY/Context-Preserve-0.01.tar.gz')
md5sums=('e28c24d9e85d3f7de1c7b9a545ba991a')
sha512sums=('f579fdb935fb3d73375d1420db4f2357fae8a9feb350f5967f17dfe67074c02a5567180151fff6387324d995782a720e704cb0f5f5332623e88730117c3fe160')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Context-Preserve-${pkgver}"
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
