# Maintainer: William Varmus <0@willvar.tw>

_extname=jsonpath
pkgname=php-$_extname
pkgdesc='Extract data using JSONPath notation for PHP'
pkgver=3.0.0
pkgrel=2
arch=('x86_64')
url='https://github.com/supermetrics-public/pecl-jsonpath'
license=('PHP-3.01')
depends=('php>=8.0')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('198ae484102b4404d94e2ad0b38d1dbf78ec55067f0b92f0dfaa2afcad906268')

prepare() {
  cd "${srcdir}/${_extname}-${pkgver}"
  phpize --clean
  phpize
  ./configure --prefix=/usr --enable-jsonpath
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