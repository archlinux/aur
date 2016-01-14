# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php56-geoip
_pkgbase="${pkgname#php56-}"
_phpbase="${pkgname/-geoip}"
pkgver=1.1.0
pkgrel=2
_svnrev=337409
pkgdesc="GeoIP module for PHP"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/geoip"
license=('PHP')
depends=('php56>=5.6.17-3' 'geoip')
backup=('etc/php56/conf.d/geoip.ini')
source=("https://pecl.php.net/get/geoip-${pkgver}.tgz")

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  phpize56
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=geoip.so' >geoip.ini
  install -Dm644 geoip.ini "$pkgdir/etc/php56/conf.d/geoip.ini"
}

# vim:set ts=2 sw=2 et:
md5sums=('1a779f7b3dd275e497846ce302b3776b')
