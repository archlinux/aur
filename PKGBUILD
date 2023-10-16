# Maintainer: Eren Hatirnaz <erenhatirnaz@gmail.com>

pkgname=php80-xdebug
_name=xdebug
_upstream=xdebug
pkgver=3.2.2
pkgrel=1
pkgdesc="xdebug module for php 8.0"
arch=('x86_64')
url="https://github.com/xdebug/xdebug"
license=('Xdebug')
depends=('glibc' 'php80')
backup=("etc/php80/conf.d/40-${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_upstream}/${_upstream}/archive/${pkgver}.tar.gz"
        "40-xdebug.ini")
sha512sums=('ae37e78de691d60e7497a5c1c205c3dbe426f621f5c1f9b28bab19ca97597ab9b72d915b4a55e3816f9d0d3dce6d01400612e1b62d3a9199f7cab08b97cc9a62'
            '738e6939a129a557d307a1659dfdfb0a0ded783b31c6c9a85f18cfa380a13afef4386cccce5a9ad3e1afcc66a2dedbebf29fa96d91f618a76af4a4d9e504f74e')
b2sums=('6c1330fb075ff8a78d33a589a3bc8ea18ae3b7a45e91d8786d0b9074eb908ef0cf679f46d6e544afe942aea05f40ac1a7c79a2ec9f652e2eff0f439182262a26'
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
