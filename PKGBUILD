# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-format-oracle
pkgver=0.06
pkgrel="2"
pkgdesc="Parse and format Oracle dates and timestamps"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/DateTime-Format-Oracle/"
depends=(perl-datetime
         perl-datetime-format-builder
         perl-convert-nlsdateformat)
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/K/KO/KOLIBRIE/DateTime-Format-Oracle-${pkgver}.tar.gz)
md5sums=('a288d1b06d808f98bf38d472e64f6dda')

build() {
  cd ${srcdir}/DateTime-Format-Oracle-${pkgver}

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd ${srcdir}/DateTime-Format-Oracle-${pkgver}
  make install DESTDIR=${pkgdir}

  # remove perllocal.pod and .packlist
  find ${pkgdir} '(' -name perllocal.pod -o -name .packlist ')' -delete
}
