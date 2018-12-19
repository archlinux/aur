# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgname=perl-io-async
_dist="IO-Async"
pkgver=0.72
pkgrel=1
pkgdesc="Asynchronous event-driven programming"
arch=('any')
url="https://metacpan.org/release/IO-Async"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-future' 'perl-struct-dumb')
makedepends=('perl-test-fatal' 'perl-test-identity' 'perl-test-refcount')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_dist}-${pkgver}.tar.gz")
md5sums=('02fea9c6b45ff54c9b4e0475fbeffd52')

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  ./Build test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
