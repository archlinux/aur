# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

pkgname='perl-cache-fastmmap'
_pkgname='Cache-FastMmap'
pkgver='1.44'
pkgrel='1'
pkgdesc="Uses an mmap'ed file to act as a shared memory interprocess cache"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/Cache-FastMmap"
source=("http://search.cpan.org/CPAN/authors/id/R/RO/ROBM/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('35ac9ef19fe8f7857d3d999274fcfb8fb3b62524e29db5dde846ab51e77a0166b48e063ece4e1621f4ad53a3264ac607879e3a0ae4decaf1d3a16c4284b4b6ce')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
