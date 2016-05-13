# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=lib32-qt5-base-bin
pkgver=5.6.0_5
pkgrel=1
pkgdesc="Repackaged qt5-base"
arch=('x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('lib32-libjpeg-turbo' 'lib32-xcb-util-keysyms' 'lib32-libgl' 'lib32-fontconfig' 'lib32-xcb-util-wm' 'lib32-libxrender' 'lib32-libxi' 'lib32-sqlite' 'lib32-xcb-util-image' 'lib32-icu' 'lib32-libsm' 'lib32-libxkbcommon-x11'  'qt5-base')
provides=('lib32-qt5-base')
conflicts=('lib32-qt-base' 'lib32-qt4')
source=("qt5-base-i686.pkg.tar.xz::https://www.archlinux.org/packages/extra/i686/qt5-base/download/")
md5sums=('911702f5f71f9a7786688304d64c9ba4')

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/"{,include}
  cp -a "usr/include/qt" "$pkgdir/usr/include/qt-32"
  cp -a "usr/lib" "$pkgdir/usr/lib32"

  # fix CMake modules for lib32
  find "$pkgdir/usr/lib32/cmake" -type f -exec sed -i 's|/usr/lib|/usr/lib32|g' '{}' ';'

  # NOT TESTED
  # move lib32/qt to lib32/qt5 to avoid conflicts with lib32-qt4
  #mv "$pkgdir/usr/lib32/qt" "$pkgdir/usr/lib32/qt5"
  # fix CMake modules for for the lib32/qt5 rename
  #find "$pkgdir/usr/lib32/cmake" -type f -exec sed -i 's|/lib/qt|/lib/qt5|g' '{}' ';'
}
