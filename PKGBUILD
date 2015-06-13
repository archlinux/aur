# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-class-accessor-grouped'
pkgver='0.10012'
pkgrel='1'
pkgdesc="Lets you build groups of accessors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-module-runtime>=0.012')
makedepends=('perl-test-exception>=0.31')
url='http://search.cpan.org/dist/Class-Accessor-Grouped'
source=("http://cpan.metacpan.org/authors/id/R/RI/RIBASUSHI/Class-Accessor-Grouped-${pkgver}.tar.gz")
md5sums=('cd9fad3112c315d60b5fca5b17e98996')
sha512sums=('195c4b1f9897b50753231ab6c893987a3e49e6283713175d612843651428c8cb2eb791a5385e25607a1db189861811efade33f94ef33c36cd41624e793ca20d1')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Class-Accessor-Grouped-${pkgver}"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/Class-Accessor-Grouped-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/Class-Accessor-Grouped-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
