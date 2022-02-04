# Maintainer: Eren Hatirnaz <erenhatirnaz@gmail.com>

pkgname=php80-xdebug
_name=xdebug
_upstream=xdebug
pkgver=3.1.3
pkgrel=1
pkgdesc="xdebug module for php 8.0"
arch=('x86_64')
url="https://github.com/xdebug/xdebug"
license=('Xdebug')
depends=('glibc' 'php80')
backup=("etc/php80/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_upstream}/${_upstream}/archive/${pkgver}.tar.gz"
        "xdebug.ini")
sha512sums=('cd2e85ce37f5122bcaa8300061be3b244bf9a58060e4e7286b3b52e9ab592f9a8ad43b62d53f13c7be878bb8662ff7aba187b73040bea79a3244df3d6b59e27b'
            '738e6939a129a557d307a1659dfdfb0a0ded783b31c6c9a85f18cfa380a13afef4386cccce5a9ad3e1afcc66a2dedbebf29fa96d91f618a76af4a4d9e504f74e')
b2sums=('abc799f966c20ba868d57e707ebc35e1f2d4ef5567bcd373ae5ae2ada58fbd4a4a807cfdf520cb883f08bc5296f219d190865462eab7d11ff2cb8c12a33b671b'
        '0fc863dae2014b5601ba77ffb236772573fbb9fdbd1e772fa8894ac5dfde0eb5179efa591e7191e6b4eeb25a423f332a5be3c0121e4d019a5ab81b3796b145ad')

prepare() {
  mv -v "${_upstream}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  phpize80
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --with-php-config=/usr/bin/php-config80 \
              --enable-xdebug
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "$srcdir"/xdebug.ini "$pkgdir"/etc/php80/conf.d/xdebug.ini
}
