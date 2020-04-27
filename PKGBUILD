# Maintainer: adlerweb <aur at adlerweb dot info>#Maintainer: 

pkgname=php-dio
pkgver=0.2.0
pkgrel=1
pkgdesc="POSIX direct I/O functions for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/dio"
license=('PHP')
depends=('php' 'php-pear')
makedepends=('autoconf')
source=(http://pecl.php.net/get/dio-${pkgver}.tgz)
sha512sums=('172c2a2a84d348d684d84ca94f23b767952461ca848cd114e899ea3fd39503a35ac0624a2a774b9dc6fd2d463d3f6aa6937e780e2faa6a0955a8594aad27ec8b')

build() {
  cd ${srcdir}/dio-${pkgver}
  phpize || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd ${srcdir}/dio-${pkgver}
  make INSTALL_ROOT=${pkgdir}/${pkgname} install || return 1
  echo 'extension=dio.so' > dio.ini
  install -D -m644 dio.ini "${pkgdir}/etc/php/conf.d/dio.ini"
  install -D -m644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

