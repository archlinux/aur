# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=php-geoip
pkgver=1.1.0
pkgrel=2
_svnrev=337409
pkgdesc="GeoIP module for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/geoip"
license=('PHP')
depends=('php' 'geoip')
makedepends=('subversion')
backup=('etc/php/conf.d/geoip.ini')
#source=(http://pecl.php.net/get/geoip-$pkgver.tgz)
source=("$pkgname::svn+https://svn.php.net/repository/pecl/geoip/trunk#revision=$_svnrev")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=geoip.so' >geoip.ini
  install -Dm644 geoip.ini "$pkgdir/etc/php/conf.d/geoip.ini"
}

# vim:set ts=2 sw=2 et:
