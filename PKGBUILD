# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-open
pkgver=1.2.1.0
pkgrel=1
_builderver=1.2.1.0
pkgdesc="A protocol plugin for Remmina to open a document with its associated application."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina')
makedepends=('pkg-config' 'cmake')
optdepends=('xdg-utils: for Automatically detected option'
            'libgnome: for Open for GNOME option')
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bf2a289f30f1176d3eb1ffd33bfeeaa80b5efd68562eb254a16d1c97337f016b'
            '9bd1e4784a8ab91043a9e8f2bf4a000b3b2c4440d4594f52920f0c48bf713bc6')

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
