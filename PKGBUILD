# Maintainer: William Varmus <0@willvar.tw>

_extname=jsonpath
pkgname=php-$_extname
pkgdesc='Extract data using JSONPath notation for PHP'
pkgver=3.1.0
pkgrel=1
arch=('x86_64')
url='https://github.com/supermetrics-public/pecl-jsonpath'
license=('PHP-3.01')
depends=('php>=8.0')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('e15d3ea5e252be660e64a10e77a3ffc1455ff26c0da32392fdfb765dce0123c0')

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
