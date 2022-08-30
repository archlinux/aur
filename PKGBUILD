# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>

pkgname=solarus-git
pkgver=1.5.3.r1446.g2593c31de
pkgrel=2
pkgdesc="An open-source adventure 2D game engine (git version)"
arch=('i686' 'x86_64')
url="http://www.solarus-games.org/"
license=('GPL3')
depends=('glm'
         'hicolor-icon-theme'
         'libmodplug'
         'libvorbis'
         'luajit'
         'openal'
         'physfs'
         'qt5-base'
         'qt5-tools'
         'sdl2>=2.0.6'
         'sdl2_image'
         'sdl2_ttf')
makedepends=('git' 'cmake')
provides=('solarus')
conflicts=('solarus')
source=('git+https://gitlab.com/solarus-games/solarus.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tag | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cmake -B build -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

build() {
  cd build
  make
}

check() {
  cd build
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
