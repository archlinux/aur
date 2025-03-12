# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-format-oracle
pkgver=0.06
pkgrel='5'
pkgdesc="Parse and format Oracle dates and timestamps"
arch=(any)
license=('Artistic-2.0')
url="https://metacpan.org/dist/DateTime-Format-Oracle"
depends=(perl-datetime
         perl-datetime-format-builder
         perl-convert-nlsdateformat)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/K/KO/KOLIBRIE/DateTime-Format-Oracle-${pkgver}.tar.gz")
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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
