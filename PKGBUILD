# Maintainer:  Maxim Novikov <the.mlex@gmail.com>

pkgname=php-pinba
_pkgname=pinba_extension-edbc313f1b4fb8407bf7d5acf63fbb0359c7fb2e
pkgver=1.1.1
pkgrel=1
pkgdesc="Pinba client C-extension for PHP"
url="http://pinba.org"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('php')
makedepends=('gcc')
source=(https://github.com/tony2001/pinba_extension/archive/edbc313f1b4fb8407bf7d5acf63fbb0359c7fb2e.zip)
sha256sums=('SKIP')

build() {
 cd "$srcdir/$_pkgname"
 phpize
 ./configure --prefix=/usr --enable-pinba
 make
}

package() {
  cd "$srcdir/$_pkgname"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=pinba.so' > pinba.ini 
  install -Dm644 pinba.ini "$pkgdir/etc/php/conf.d/pinba.ini"
}
