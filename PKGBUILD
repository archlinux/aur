# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-folder
pkgver=1.2.1.0
pkgrel=1
_builderver=1.2.1.0
pkgdesc="A protocol plugin for Remmina to open a folder."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina')
makedepends=('pkg-config' 'cmake')
optdepends=(
  'xdg-utils: for Automatically detected option'
  'libgnome: for Open for GNOME option'
  'nautilus: for Nautilus option'
  'pcmanfm: for PCManFM option'
  'kdebase-dolphin: for Dolphin Browser option'
)
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bf2a289f30f1176d3eb1ffd33bfeeaa80b5efd68562eb254a16d1c97337f016b'
            '1beb61033e5ebfef625dab8e051939d1457dfdf15d23d71691820b5b547ca101')

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
