# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=perl-geoip
pkgver=1.50
pkgrel=1
pkgdesc="GeoIP Perl API"
arch=(i686 x86_64)
license=(GPL)
url="https://github.com/maxmind/geoip-api-perl"
source=("https://github.com/maxmind/geoip-api-perl/archive/v${pkgver}.zip")
md5sums=('32a7c8775d7b7748f9b940c4fa0bc233')
depends=('geoip')
provides=('Cassandra::Simple')

build() {
  cd "$srcdir/geoip-api-perl-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd "$srcdir/geoip-api-perl-${pkgver}"
  make install DESTDIR=${pkgdir}

  # remove perllocal.pod and .packlist
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
