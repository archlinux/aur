# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
_php=php74
_phpize=phpize74
pkgname="${_php}-xdebug"
pkgver=3.0.4
pkgrel=1
pkgdesc="PHP debugging extension"
arch=("x86_64")
url="https://xdebug.org/"
license=('Xdebug')
depends=("${_php}")
source=("https://xdebug.org/files/xdebug-${pkgver}.tgz"
  "xdebug.ini")
sha256sums=('b27290491f4634b0cd3badfc3a2be98fb1e3c0c3710a706724d8b195baad72af'
            '7c66883dc2ade69069ef84e30188b25630748aa9c8b0dd123727c00505421205')
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
