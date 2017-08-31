# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Giovanni Cucca <giovanni.cucca@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=trackballs
pkgver=1.2.3
pkgrel=1
pkgdesc="Simple game similar to the classical game Marble Madness on the Amiga in the 80's"
arch=('i686' 'x86_64')
license=('GPL')
url="http://trackballs.sourceforge.net/"
depends=('guile' 'sdl_ttf' 'sdl_image' 'sdl_mixer' 'mesa')
source=(https://github.com/trackballs/trackballs/archive/v${pkgver}.tar.gz)

build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i '/Icon=/s%.*%Icon=trackballs-64x64.png%' share/icons/trackballs.desktop
  [ ! -d build ] && mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  sed '/GUILE_LIBRARY:FILEPATH/s%libguile.so%libguile-2.2.so%' CMakeCache.txt
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
  
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}
  install -m644 ../share/icons/trackballs.desktop ${pkgdir}/usr/share/applications
  install -m644 ../share/icons/*.png ${pkgdir}/usr/share/pixmaps
}
md5sums=('cbd983214fd22605aad1b382e28db215')
