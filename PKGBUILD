# Maintainer: Félix "passcod" Saparelli <felix @ passcod . name>
# Contributor: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-gearman
pkgver=2.0.5
pkgrel=4
pkgdesc="PHP wrapper to libgearman"
url="https://github.com/wcgallego/pecl-gearman"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'gearman')
backup=('etc/php/conf.d/gearman.ini')

source=("https://github.com/wcgallego/pecl-gearman/archive/gearman-${pkgver}.tar.gz")
sha512sums=('f8b8f8291423a37263a0d3bf7a702d0bb9c8f3d18922388af71ac710db7dcd1755c9d143364c1427b584a3852dfccba254468c9df9cadbc1249c9c7e52510353')

build() {
  cd "${srcdir}/pecl-gearman-gearman-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/pecl-gearman-gearman-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo 'extension=gearman.so' > gearman.ini
  install -Dm644 gearman.ini "${pkgdir}/etc/php/conf.d/gearman.ini"
}
