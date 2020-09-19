# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>

pkgname=solarus-git
pkgver=1.5.3.r1139.gf0eadc40f
pkgrel=2
pkgdesc="An open-source adventure 2D game engine (git version)"
arch=('i686' 'x86_64')
url="http://www.solarus-games.org/"
license=('GPL3')
depends=('glm'
         'hicolor-icon-theme'
         'libmodplug>=0.8.8.4'
         'libvorbis'
         'luajit>=2.0'
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
source=($pkgname::'git+https://gitlab.com/solarus-games/solarus.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS $CPPFLAGS" -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" .
}

build() {
  make -C "$pkgname"
}

check() {
  make -C "$pkgname" test
}

package() {
  make -C "$pkgname" install
}
