# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=perl-geoip
pkgver=1.45
pkgrel=2
pkgdesc="GeoIP Perl API"
arch=(i686 x86_64)
license=(GPL)
url="https://github.com/maxmind/geoip-api-perl"
source="https://github.com/maxmind/geoip-api-perl/archive/v${pkgver}.zip"
md5sums=('4f989545128f8e0e2717c23375a9027c')
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
