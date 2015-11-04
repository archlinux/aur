# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=lib32-qt5-base-bin
pkgver=5.5.1
pkgrel=3
pkgdesc="Repackaged qt5-base"
arch=('x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-base' 'lib32-libjpeg-turbo' 'lib32-libdbus' 'lib32-fontconfig' 'lib32-systemd' \
         'lib32-libxrender' 'lib32-libxi' 'lib32-sqlite' 'lib32-icu')
provides=('lib32-qt5-base')
conflicts=('lib32-qt-base')
source=("http://mirrors.kernel.org/archlinux/extra/os/i686/qt5-base-$pkgver-$pkgrel-i686.pkg.tar.xz")
md5sums=('8b787fa1d8a32bca14a55b91b0e086bc')

package() {
  mkdir -p "$pkgdir/usr/"{,include}
  cp -a "usr/include/qt" "$pkgdir/usr/include/qt-32"
  cp -a "usr/lib" "$pkgdir/usr/lib32"

  # fix CMake modules
  find "$pkgdir/usr/lib32/cmake" -exec sed -i 's|/usr/lib|/usr/lib32|g' '{}' ';'
}
