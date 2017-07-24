# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgname=perl-struct-dumb
pkgver=0.09
pkgrel=1
pkgdesc="Make simple lightweight record-like structures"
arch=('any')
url="http://search.cpan.org/dist/Struct-Dumb"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('perl-test-fatal')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Struct-Dumb-${pkgver}.tar.gz")
md5sums=('bb9ea100dc6f9ecd1c345381930dda08')

build() {
  cd "${srcdir}/Struct-Dumb-${pkgver}"
  
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/Struct-Dumb-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  make test
}

package() {
  cd "${srcdir}/Struct-Dumb-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
