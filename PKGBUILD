# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
pkgname=php73-xdebug
pkgver=3.0.2
pkgrel=1
pkgdesc="PHP debugging extension"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=("php73")
source=("https://xdebug.org/files/xdebug-${pkgver}.tgz"
  "xdebug.ini")
sha256sums=('096d46dec061341868d3e3933b977013a592e2e88992b2c0aba7fa52f87c4e17'
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
