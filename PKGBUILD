# Maintainer: Eren Hatirnaz <erenhatirnaz@gmail.com>

pkgname=php80-xdebug
_name=xdebug
_upstream=xdebug
pkgver=3.1.4
pkgrel=1
pkgdesc="xdebug module for php 8.0"
arch=('x86_64')
url="https://github.com/xdebug/xdebug"
license=('Xdebug')
depends=('glibc' 'php80')
backup=("etc/php80/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_upstream}/${_upstream}/archive/${pkgver}.tar.gz"
        "xdebug.ini")
sha512sums=('efe87d1bcf8387b64a2f54be30ce24dfbd72c7e951304d20321c06548cfc16690d8195030cfcf6b6cfdf015c62904b6811d3a8c09400ef90881ed2370c6ddadc'
            '738e6939a129a557d307a1659dfdfb0a0ded783b31c6c9a85f18cfa380a13afef4386cccce5a9ad3e1afcc66a2dedbebf29fa96d91f618a76af4a4d9e504f74e')
b2sums=('c2a9bf53f36508363b54325388177ffd13019560a231489233e82e2b5e48ee85a8a42b5fbb77be35a0ea8e37145bac65cfa54c0193cb3ca5a8eb069effa85244'
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
