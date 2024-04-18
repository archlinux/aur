phpbase=81
suffix=
extname=igbinary
pkgname="php${phpbase}-${extname}${suffix}"
pkgver=3.2.15
pkgrel=1
pkgdesc="php${phpbase} PECL extension igbinary"
url="http://pecl.php.net/package/${extname}"
arch=('x86_64' 'i686')
license=('PHP')
makedepends=("php${phpbase}${suffix}")
depends=("php${phpbase}${suffix}")
backup=("etc/php${phpbase}/conf.d/${extname}.ini")
source=("http://pecl.php.net/get/${extname}-${pkgver}.tgz")

build() {
  cd "$srcdir/$extname-$pkgver"
  phpize${phpbase}${suffix}
  ./configure --prefix=/usr CFLAGS="-O2 -g" --enable-igbinary --with-php-config=php-config${phpbase}${suffix}
  make
}

check() {
  cd "$srcdir/$extname-$pkgver"
  NO_INTERACTION=1 make test
}

package() {
  cd "$srcdir/$extname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  install -D -m0644 \
    "${srcdir}/${extname}-${pkgver}/${extname}.php.ini" \
    "${pkgdir}/etc/php${phpbase}${suffix}/conf.d/${extname}.ini"
}

sha256sums=('eff099b0343b45fbe9765d4b3d441064ddefbbf9cfb7198487de9bda6b8f4907')
