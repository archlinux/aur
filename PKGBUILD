# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-data-page'
pkgver='2.03'
pkgrel='3'
pkgdesc="help when paging through sets of results"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-class-accessor-chained')
makedepends=('perl-test-exception')
url='https://metacpan.org/pod/Data::Page'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Data-Page-${pkgver}.tar.gz")
sha512sums=('5c0c411e8b03163b2b88b7ab6432def0ddcce48987e98868897e89d0220665537f23d9a56b6d544a5c6fb67f615a2db582764ebcaa612cb2a8906ba660fc3c59')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Data-Page-${pkgver}"
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
