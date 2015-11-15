# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-url
pkgver=1.2.0.0
pkgrel=1
_builderver=1.2.0.0
pkgdesc="A protocol plugin for Remmina to open an URL in an external browser."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina')
makedepends=('pkg-config' 'cmake')
optdepends=('firefox: for Mozilla Firefox option'
            'iceweasel: for Iceweasel option'
            'epiphany: for Epiphany option')
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c3cb8201943b00d7475922055a68dd86ec163a01e1f578aae32427ab2427121e'
            'a8e18d2010688acbbfc3ea965349722706e5ed919b256efc03521f11e2d698d9')

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
