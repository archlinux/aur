_phpbase=72
_suffix=
pkgname="php${_phpbase}-igbinary"
_pkgname=igbinary
pkgver=3.2.6
pkgrel=1
pkgdesc="php${_phpbase} extension igbinary"
url="http://pecl.php.net/package/igbinary"
arch=('x86_64')
license=('PHP')
makedepends=("php${_phpbase}${_suffix}")
depends=("php${_phpbase}${_suffix}")
backup=("etc/php${_phpbase}/conf.d/${_pkgname}.ini")
source=("http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz")
md5sums=('6970abb34217faff470767c2b84ea2da')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  phpize${_phpbase}
  ./configure --prefix=/usr CFLAGS="-O2 -g" --enable-igbinary --with-php-config=php-config${_phpbase}
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  NO_INTERACTION=1 make test
}

package() {
  cd "$srcdir/igbinary-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  install -D -m0644 \
    "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}.php.ini" \
    "${pkgdir}/etc/php${_phpbase}/conf.d/${_pkgname}.ini"
  install -D -m0644 \
    "${srcdir}/${_pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"  
}
