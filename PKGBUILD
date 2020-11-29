# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
pkgname=php73-xdebug
pkgver=3.0.0
pkgrel=1
pkgdesc="PHP debugging extension"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=("php73")
source=("https://xdebug.org/files/xdebug-${pkgver}.tgz"
  "xdebug.ini")
sha256sums=('845007e82c1d4e088770d1d87f5832aa3a767cb5a3664fc1615db62cecc3ca62'
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
