# Maintainer: Eren Hatirnaz <erenhatirnaz@gmail.com>

pkgname=php80-xdebug
_name=xdebug
_upstream=xdebug
pkgver=3.2.1
pkgrel=1
pkgdesc="xdebug module for php 8.0"
arch=('x86_64')
url="https://github.com/xdebug/xdebug"
license=('Xdebug')
depends=('glibc' 'php80')
backup=("etc/php80/conf.d/40-${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_upstream}/${_upstream}/archive/${pkgver}.tar.gz"
        "40-xdebug.ini")
sha512sums=('c7246e8cf7dc22b9c21ec1586fc5393817b1b5eefff9339652846340a6cc57fa72adb6c9229a87ac9849e8f5762aafbf140d99d0978950e93562e228d9da5a6b'
            '738e6939a129a557d307a1659dfdfb0a0ded783b31c6c9a85f18cfa380a13afef4386cccce5a9ad3e1afcc66a2dedbebf29fa96d91f618a76af4a4d9e504f74e')
b2sums=('046120555bc6ff5b15380618c8126387eec213036299dfaefd2d8bca77c625c064dec938f56d665aae479c7fd76a9fdcc0304695f8ec44534d0a5265d9073159'
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
  install -D -m 644 "$srcdir"/40-xdebug.ini "$pkgdir"/etc/php80/conf.d/40-xdebug.ini
}
