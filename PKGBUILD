# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-open
pkgver=1.1.1.0
pkgrel=2
_builderver=1.1.0.0
pkgdesc="A protocol plugin for Remmina to open a document with its associated application."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina')
makedepends=('pkg-config' 'cmake')
optdepends=(
  'xdg-utils: for Automatically detected option'
  'libgnome: for Open for GNOME option'
)
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0d41d50731ae25dfa1e66394cfa489d598cf491d36dbaf44d72ad921589e0960'
            '3801da4e7967dcfafa7ea7032d2d0ae354f4b1627ca98033a9e601e44ea86bd4')

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
