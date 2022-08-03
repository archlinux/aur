# Maintainer: Luke Arms <luke@arms.to>
_php=php7
_phpize=phpize7
pkgname=${_php}-xdebug
pkgver=3.1.5
pkgrel=1
pkgdesc="PHP debugging extension"
arch=('x86_64')
url="https://xdebug.org/"
license=('GPL')
depends=("${_php}")
backup=("etc/${_php}/conf.d/xdebug.ini")
source=("https://xdebug.org/files/xdebug-${pkgver}.tgz"
        'xdebug.ini')
sha256sums=('55f6ef381245da079b2fc5ce1cfbcb7961197d0c0e04f9d977613cf9aa969a79'
            '7c66883dc2ade69069ef84e30188b25630748aa9c8b0dd123727c00505421205')

build() {
  cd "$srcdir"/xdebug-${pkgver}
  ${_phpize}
  ./configure --prefix=/usr --enable-xdebug
  make
}

package() {
  cd "$srcdir"/xdebug-${pkgver}
  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "$srcdir"/xdebug.ini "$pkgdir"/etc/${_php}/conf.d/xdebug.ini
}
