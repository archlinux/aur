# Maintainer: Joey Fu <aur [at] joeyfff [dot] com>

_phpbase=71
pkgname=php71-igbinary
_pkgname=igbinary
pkgver=3.0.1
pkgrel=1
pkgdesc="php71 extension igbinary"
url="http://pecl.php.net/package/igbinary"
arch=('x86_64')
license=('PHP')
makedepends=("php${_phpbase}")
depends=("php${_phpbase}")
backup=("etc/php${_phpbase}/conf.d/igbinary.ini")
source=("http://pecl.php.net/get/igbinary-${pkgver}.tgz")
md5sums=('fb3b2f7fa306ca582afd9f382c409a24')

build() {
  cd "$srcdir/igbinary-$pkgver"
  phpize${_phpbase}
  ./configure --prefix=/usr CFLAGS="-O2 -g" --enable-igbinary
  make
}

check() {
  cd "$srcdir/igbinary-$pkgver"
  NO_INTERACTION=1 make test
}

package() {
  cd "$srcdir/igbinary-$pkgver"
  make INSTALL_ROOT="$pkgdir" install  
  install -D -m0644 \
    "${srcdir}/${_pkgname}-${pkgver}/igbinary.php.ini" \
    "${pkgdir}/etc/php71/conf.d/igbinary.ini"
  install -D -m0644 \
    "${srcdir}/${_pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"  
}
