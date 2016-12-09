pkgname=perl-ip-country
pkgver=2.28
pkgrel=1
pkgdesc="lookup of country codes by IP address"
arch=('any')
license=('PerlArtistic2')
options=('!emptydirs')
depends=('perl')
url="http://search.cpan.org/dist/IP-Country/"
source=(http://search.cpan.org/CPAN/authors/id/N/NW/NWETTERS/IP-Country-$pkgver.tar.gz)
sha256sums=('88db833a5ab22ed06cb53d6f205725e3b5371b254596053738885e91fa105f75')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/IP-Country-${pkgver}"
  perl Makefile.PL
  make
}
check() {
  cd "${srcdir}/IP-Country-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/IP-Country-${pkgver}"
  make install
}
