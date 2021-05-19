# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>
# Contributor: Félix "passcod" Saparelli <felix @ passcod . name>
# Contributor: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-gearman
pkgver=2.1.0
pkgrel=5
pkgdesc="PHP wrapper to libgearman"
url="https://github.com/php/pecl-networking-gearman"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'gearman')
backup=('etc/php/conf.d/gearman.ini')

source=("https://github.com/php/pecl-networking-gearman/archive/refs/tags/gearman-${pkgver}.tar.gz")
sha512sums=('99545525095ebe5073617e2748c652ee75cfacd5d166ac65f9e69998dea8cd7fbc06542b78779ba5b0ce1f9e5d57de5be653cf90c387c825c24798559b038397')

build() {
  cd "${srcdir}/pecl-networking-gearman-gearman-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/pecl-networking-gearman-gearman-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo 'extension=gearman.so' > gearman.ini
  install -Dm644 gearman.ini "${pkgdir}/etc/php/conf.d/gearman.ini"
}
