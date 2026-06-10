# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>
# Maintainer: William Varmus <0@willvar.tw>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

_extname=msgpack
pkgname=php-$_extname
pkgver=3.0.1
pkgrel=1
pkgdesc="PHP extension for interfacing with MessagePack"
arch=('i686' 'x86_64')
license=('BSD-3-Clause')
url='https://github.com/msgpack/msgpack-php'
depends=('php>=7.0')
source=("https://pecl.php.net/get/$_extname-${pkgver}.tgz")
sha256sums=('e30be355ab79aaea4568692fbd6073fd7c7f50ea8d3cf12edce40fc0c921d868')

prepare() {
  cd "${srcdir}/${_extname}-${pkgver}"
  phpize --clean
  phpize
  ./configure --prefix=/usr --with-msgpack
  echo "extension=${_extname}.so" > "${_extname}.ini"
}

build() {
  cd "${srcdir}/${_extname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_extname}-${pkgver}"
  TEST_PHP_ARGS="-q -n" make test
}

package() {
  cd "${srcdir}/${_extname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini" \
  && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
