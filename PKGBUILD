# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-object
pkgver=0.860
pkgrel="2"
pkgdesc="A simple object base class"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-Object/"
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/J/JS/JSIRACUSA/Rose-Object-${pkgver}.tar.gz)
md5sums=('34d662a480065ea4fb6ff47fbe2e6ca3')
sha512sums=('3bb5496d899bb596dd4a7e48455412dc481c88d0f286b6d4dc5ed22f40c13a70ea93add8f3fcce0373fef3921a0b2ebbbcdf6abed050f09fac01bdb5cc7bab8d')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Rose-Object-${pkgver}"
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
