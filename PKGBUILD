# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Giovanni Cucca <giovanni.cucca@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=trackballs
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple game similar to the classical game Marble Madness on the Amiga in the 80's"
arch=('i686' 'x86_64')
license=('GPL')
url="http://trackballs.sourceforge.net/"
depends=('guile1.8' 'sdl_ttf' 'sdl_image' 'sdl_mixer' 'mesa')
source=(https://github.com/trackballs/trackballs/archive/v1.2.0.tar.gz)

build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i '/Icon=/s%.*%Icon=trackballs-64x64.png%' share/icons/trackballs.desktop
  [ ! -d build ] && mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
  install -m644 ${srcdir}/*.map ${pkgdir}/usr/share/trackballs/levels
  install -m644 ${srcdir}/*.scm ${pkgdir}/usr/share/trackballs/levels
  install -m644 ${srcdir}/*.jpg ${pkgdir}/usr/share/trackballs/levels
  install -m644 ${srcdir}/*.set ${pkgdir}/usr/share/trackballs/levels
  
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}
  install -m644 ../share/icons/trackballs.desktop ${pkgdir}/usr/share/applications
  install -m644 ../share/icons/*.png ${pkgdir}/usr/share/pixmaps
}
md5sums=('3fd42492c724f009d7da9144c45fa65f')
