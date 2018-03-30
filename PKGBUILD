# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=perl-config-onion
_dist=Config-Onion
pkgver=1.007
pkgrel=1
pkgdesc="Config::Onion - Layered configuration, because configs are like ogres"
arch=('any')
url="https://github.com/dsheroh/Config-Onion"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DS/DSHEROH/Config-Onion-${pkgver}.tar.gz")
sha256sums=('327fddf68e138b2469e5a2bae37c733f87ca84caf61e1cfaa949be3d950da8af')

build() {
  cd  "$srcdir"/${_dist}-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "$srcdir"/${_dist}-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
