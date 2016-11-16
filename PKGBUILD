# Maintainer:  Aleksey Vasilenko <aleksey.vasilenko@gmail.com>

pkgname=php-pecl-pthreads
pkgver=3.1.6
pkgrel=1
pkgdesc="PHP pthreads extension"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/pthreads"
license=('BSD')
depends=('php-zts' 'php-pear')
source=("http://pecl.php.net/get/pthreads-${pkgver}.tgz")
md5sums=('c7a9e9ccf693a3f0d419c2f952d65e23')

build() {
  cd "${srcdir}/pthreads-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/pthreads-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo 'extension=pthreads.so' > pthreads.ini

  install -Dm644 "pthreads.ini" "${pkgdir}/etc/php/conf.d/pthreads.ini"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
