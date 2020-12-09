# Maintainer: Timo Sarawinski <timo@it-kraut.net>

_pkgname=php-lzo
pkgname=${_pkgname}-git
pkgver=r6.cad6299
pkgrel=2
pkgdesc="lzo compression for php"
arch=('i686' 'x86_64')
license=('PHP')
url='https://github.com/adsr/php-lzo'
depends=('php' 'lzo')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/adsr/php-lzo.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  phpize
  ./configure --with-php-config=/usr/bin/php-config
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}"

  make install INSTALL_ROOT="${pkgdir}"
}
