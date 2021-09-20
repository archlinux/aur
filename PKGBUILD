# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Giovanni Cucca <giovanni.cucca@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>
# Contributor: frsfnrrg

pkgname=trackballs
pkgver=1.3.2
pkgrel=2
pkgdesc="Simple game similar to the classical game Marble Madness on the Amiga in the 80's"
arch=('i686' 'x86_64')
license=('GPL')
url="https://trackballs.github.io/"
install=trackballs.install
depends=('guile' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme' 'gettext')
replaces=(trackballs-music)
source=(https://github.com/trackballs/trackballs/archive/v${pkgver}.tar.gz
        find_guile.patch::https://github.com/trackballs/trackballs/commit/21b8127a88c6078a543c28152e11668cc172ff45.diff)

prepare() {
  cd ${srcdir}/$pkgname-$pkgver
  patch -p1 -i "${srcdir}/find_guile.patch"
}

build() {
  cd ${srcdir}/$pkgname-$pkgver
  [ ! -d build ] && mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
}
md5sums=('85b128afca8b55d8e7ae02c21fa0427e'
         'e7206c8314716557b4b40dcc12591088')
