# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=php-lzo
pkgname=${_pkgname}-git
pkgver=r6.cad6299
pkgrel=1
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
  ./configure
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make install INSTALL_ROOT="${pkgdir}"
}
