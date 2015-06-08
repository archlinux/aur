# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

pkgname='perl-cache-fastmmap'
_pkgname='Cache-FastMmap'
pkgver='1.40'
pkgrel='3'
pkgdesc="Uses an mmap'ed file to act as a shared memory interprocess cache"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/Cache-FastMmap"
source=("http://search.cpan.org/CPAN/authors/id/R/RO/ROBM/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('55c038cc99b4f6177f45f1610c72a57eb893bfc4598909a6f10352422b8c64376e938b1b175dd417667f7fb0732a420e23bb037ce51b16ee2db2d1a712c892d1')

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
