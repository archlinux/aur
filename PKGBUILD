# Maintainer: ALEXPRO100 <alealexpro100@ya.ru>

_pkgname=admc
pkgname=${_pkgname}-git
pkgver=r3560.5cc7bbb0
pkgrel=1
pkgdesc="Altlinux group policy explorer"
arch=('any')
url="https://github.com/altlinux/admc"
license=('GPL3')
depends=('samba' 'qt5-base'  'libldap' 'krb5' 'util-linux')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/altlinux/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  ls ../
  #cmake ../${pkgname}-v${pkgver}
  cmake ../${_pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make -j$(nproc)
}

package() {
  cd build
  DESTDIR="${pkgdir}" make install
}
