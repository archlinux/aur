# Maintainer: Christophe Aubry <me@c-aubry.be>

_pkgname=php56-ssh
pkgname=${_pkgname}
pkgver=0.13
pkgrel=1
pkgdesc="An SSH2 extension for PHP"
url="http://pecl.php.net/package/ssh2"
license=('PHP')
arch=('i686' 'x86_64')
depends=('php56' 'openssh')
makedepends=('php56' 'git')
provides=('php56-ssh')
conflicts=('php56-ssh')
install=${_pkgname}.install
source=("http://pecl.php.net/get/ssh2-0.13.tgz")
sha512sums=('c031e22853bf5cf8ee59dc5b99d9e7e60af1507a22e7d0a9e2f54b8f1758a03a6cea91c539e0f667d48ec66185fdc8a28c47e5a1e10a72220c0cb16b3948e1d0')

build() {
  cd "${srcdir}/ssh2-${pkgver}"
  phpize56
  ./configure --prefix=/usr --with-ssh2
  make
}

package() {
  cd "${srcdir}/ssh2-${pkgver}"
  echo ';extension=ssh2.so' > ssh2.ini
  install -Dm644 ssh2.ini "${pkgdir}/etc/php56/conf.d/ssh2.ini"
  make install INSTALL_ROOT="${pkgdir}/"
}
