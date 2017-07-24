# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgname=perl-io-async
pkgver=0.71
pkgrel=1
pkgdesc="Asynchronous event-driven programming"
arch=('any')
url="http://search.cpan.org/dist/IO-Async"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-future' 'perl-struct-dumb')
makedepends=('perl-test-fatal' 'perl-test-identity' 'perl-test-refcount')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/IO-Async-${pkgver}.tar.gz")
md5sums=('a6925ea309ad98258aadf3fd9f7b0238')

build() {
  cd "${srcdir}/IO-Async-${pkgver}"
  
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/IO-Async-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  make test
}

package() {
  cd "${srcdir}/IO-Async-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
