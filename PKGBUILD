# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
pkgname=php73-xdebug
pkgver=3.0.1
pkgrel=1
pkgdesc="PHP debugging extension"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=("php73")
source=("https://xdebug.org/files/xdebug-${pkgver}.tgz"
  "xdebug.ini")
sha256sums=('0b95317153a2254f3da1fc9010fdffc40c9eec232be3ede088ec4c9bd94049b5'
  '7c66883dc2ade69069ef84e30188b25630748aa9c8b0dd123727c00505421205')
backup=("etc/php73/conf.d/xdebug.ini")

build() {
  cd "${srcdir}/xdebug-${pkgver}"
  phpize73
  ./configure --prefix=/usr --enable-xdebug
  make
}

package() {
  cd "${srcdir}/xdebug-${pkgver}"
  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "$srcdir"/xdebug.ini "$pkgdir"/etc/php73/conf.d/xdebug.ini
}
