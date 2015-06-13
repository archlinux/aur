# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Christian Sturm <reezer@reezer.org>

pkgname=perl-ppix-regexp
pkgver=0.037
pkgrel=1
pkgdesc="Represent a regular expression of some sort"
arch=(any)
url="https://metacpan.org/release/PPIx-Regexp"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-list-moreutils' 'perl-params-util' 'perl-readonly' 'perl-task-weaken' 'perl-ppi')
options=(!emptydirs)
source=(http://cpan.metacpan.org/authors/id/W/WY/WYANT/PPIx-Regexp-${pkgver}.tar.gz)
sha256sums=('f68d88c008e6a6f2b438048e9c3cfe3cfab3225ba8b55ed3cf07f7161702ef37')

build() {
  cd "${srcdir}/PPIx-Regexp-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/PPIx-Regexp-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/PPIx-Regexp-${pkgver}"
  make install DESTDIR="${pkgdir}/"

  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete
}
