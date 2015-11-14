# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-folder
pkgver=1.2.0.0
pkgrel=1
_builderver=1.2.0.0
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
sha256sums=('c3cb8201943b00d7475922055a68dd86ec163a01e1f578aae32427ab2427121e'
            'c17330b472c05db3c0b3e4ab29acfffa7764017d98c96bc6de6af024fc999646')

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
