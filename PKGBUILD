# Maintainer: adlerweb <aur at adlerweb dot info>#Maintainer: 

pkgname=php-dio
pkgver=0.2.1
pkgrel=1
pkgdesc="POSIX direct I/O functions for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/dio"
license=('PHP')
depends=('php')
makedepends=('autoconf')
source=(http://pecl.php.net/get/dio-${pkgver}.tgz)
sha512sums=('ed40ae3a950410e65a15c893a90d16da7f152c73e92623b68706b942c42f27e01a799134cb4b464d09f6e99c35d80e634ba662a20c7c9bc7f27ca2515c392abf')

build() {
  cd ${srcdir}/dio-${pkgver}
  phpize || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd ${srcdir}/dio-${pkgver}
  make INSTALL_ROOT=${pkgdir} install || return 1
  echo 'extension=dio.so' > dio.ini
  install -D -m644 dio.ini "${pkgdir}/etc/php/conf.d/dio.ini"
  install -D -m644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

