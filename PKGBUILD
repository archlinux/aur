# Maintainer:  Aleksey Vasilenko <aleksey.vasilenko@gmail.com>

pkgname=php-pecl-yaml
pkgver=2.0.0
pkgrel=1
pkgdesc="PHP YAML extension"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/yaml"
license=('MIT')
depends=('php' 'php-pear' 'libyaml')
source=("http://pecl.php.net/get/yaml-${pkgver}.tgz")
md5sums=('5bdb54d5cd62d41354434f4d2a1c11ee')

build() {
  cd "${srcdir}/yaml-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/yaml-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  install -d "$pkgdir/etc/php/conf.d"
  echo 'extension=yaml.so' > "${pkgdir}/etc/php/conf.d/yaml.ini"
}
