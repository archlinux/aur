# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## dfl-color-utils -> dfl-config-parser

_pkgname=config-parser
pkgbase=dfl-config-parser
pkgname=('dfl-colorschemeparser' 'dfl-colorschemeparser-qt6' 'dfl-hjsonparser' 'dfl-hjsonparser-qt6' 'dfl-wayfireparser' 'dfl-wayfireparser-qt6')
pkgver=0.2.0
pkgrel=1
pkgdesc="A Collection of Config Parsers for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja' 'qt5-base' 'qt6-base' 'dfl-color-utils' 'dfl-color-utils-qt6' 'wayfire>=0.8.0' 'glm' 'wlroots')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('1eda121f76171f7ad798b4038938bb9b')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-colorschemeparser() {
  depends=('qt5-base' 'dfl-color-utils')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
  rm "$pkgdir"/usr/lib/libdf5hjson* "$pkgdir"/usr/lib/libdf5wayfire*
  rm "$pkgdir"/usr/lib/pkgconfig/df5hjson* "$pkgdir"/usr/lib/pkgconfig/df5wayfire*
  rm "$pkgdir"/usr/include/DFL/DF5/DFHjsonParser* "$pkgdir"/usr/include/DFL/DF5/DFWayfireParser*
}

package_dfl-colorschemeparser-qt6() {
  depends=('qt6-base' 'dfl-color-utils-qt6')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
  rm "$pkgdir"/usr/lib/libdf6hjson* "$pkgdir"/usr/lib/libdf6wayfire*
  rm "$pkgdir"/usr/lib/pkgconfig/df6hjson* "$pkgdir"/usr/lib/pkgconfig/df6wayfire*
  rm "$pkgdir"/usr/include/DFL/DF6/DFHjsonParser* "$pkgdir"/usr/include/DFL/DF6/DFWayfireParser*
}

package_dfl-hjsonparser() {
  depends=('qt5-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
  rm "$pkgdir"/usr/lib/libdf5colorschemeparser* "$pkgdir"/usr/lib/libdf5wayfire*
  rm "$pkgdir"/usr/lib/pkgconfig/df5colorschemeparser* "$pkgdir"/usr/lib/pkgconfig/df5wayfire*
  rm "$pkgdir"/usr/include/DFL/DF5/DFColorScheme* "$pkgdir"/usr/include/DFL/DF5/DFWayfireParser*
}

package_dfl-hjsonparser-qt6() {
  depends=('qt6-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
  rm "$pkgdir"/usr/lib/libdf6colorschemeparser* "$pkgdir"/usr/lib/libdf6wayfire*
  rm "$pkgdir"/usr/lib/pkgconfig/df6colorschemeparser* "$pkgdir"/usr/lib/pkgconfig/df6wayfire*
  rm "$pkgdir"/usr/include/DFL/DF6/DFColorScheme* "$pkgdir"/usr/include/DFL/DF6/DFWayfireParser*
}

package_dfl-wayfireparser() {
  depends=('qt5-base' 'wayfire>=0.8.0' 'glm' 'wlroots')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
  rm "$pkgdir"/usr/lib/libdf5hjson* "$pkgdir"/usr/lib/libdf5colorschemeparser*
  rm "$pkgdir"/usr/lib/pkgconfig/df5hjson* "$pkgdir"/usr/lib/pkgconfig/df5colorschemeparser*
  rm "$pkgdir"/usr/include/DFL/DF5/DFColorScheme* "$pkgdir"/usr/include/DFL/DF5/DFHjsonParser*
}

package_dfl-wayfireparser-qt6() {
  depends=('qt6-base' 'wayfire>=0.8.0' 'glm' 'wlroots')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
  rm "$pkgdir"/usr/lib/libdf6hjson* "$pkgdir"/usr/lib/libdf6colorschemeparser*
  rm "$pkgdir"/usr/lib/pkgconfig/df6hjson* "$pkgdir"/usr/lib/pkgconfig/df6colorschemeparser*
  rm "$pkgdir"/usr/include/DFL/DF6/DFColorScheme* "$pkgdir"/usr/include/DFL/DF6/DFHjsonParser*
}
