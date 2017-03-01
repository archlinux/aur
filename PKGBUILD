# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=qtox
pkgname=qtox-git
pkgver=1.8.1.r93.gffd7d0e9
pkgrel=1
pkgdesc='Powerful Tox client written in C++/Qt that follows the Tox design guidelines.'
arch=('i686' 'x86_64')
url='https://github.com/tux3/qTox'
license=('GPL3')
depends=('desktop-file-utils'
         'libxss'
         'openal'
         'qrencode'
         'gtk2'
         'ffmpeg'
         'qt5-svg'
         'sqlcipher'
         'toxcore>=1:0.1.0')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/qTox/qTox.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  install -d build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
}

build() {
  cd $_pkgname/build
  make $MAKEFLAGS
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
