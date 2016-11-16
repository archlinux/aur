# Maintainer:  Aleksey Vasilenko <aleksey.vasilenko@gmail.com>

pkgname=php-pecl-weakref
pkgver=0.3.2
pkgrel=1
pkgdesc="PHP weak reference extension"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/weakref"
license=('PHP')
depends=('php' 'php-pear')
source=("http://pecl.php.net/get/Weakref-${pkgver}.tgz")
md5sums=('fe671e7b19334cea8b8f5f5e08d81155')

build() {
  cd "${srcdir}/Weakref-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/Weakref-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  install -d "$pkgdir/etc/php/conf.d"
  echo 'extension=weakref.so' > "${pkgdir}/etc/php/conf.d/weakref.ini"
}
