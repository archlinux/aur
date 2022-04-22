# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
_php=php74
_phpize=phpize74
pkgname="${_php}-xdebug"
pkgver=3.1.4
pkgrel=1
pkgdesc="PHP debugging extension"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=("${_php}")
source=("https://xdebug.org/files/xdebug-${pkgver}.tgz"
  "xdebug.ini")
sha256sums=('4195926f9f6c4e802ff749bb2ca85ac50636719a72e5389e372e35ef523505f9'
            'SKIP')
backup=("etc/${_php}/conf.d/xdebug.ini")

build() {
  cd "${srcdir}/xdebug-${pkgver}"
  ${_phpize}
  ./configure --prefix=/usr --enable-xdebug
  make
}

package() {
  cd "${srcdir}/xdebug-${pkgver}"
  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "${srcdir}/xdebug.ini" "${pkgdir}/etc/${_php}/conf.d/xdebug.ini"
}
