pkgname=corsix-th-git
pkgver=0.64.r10.gb7abdd01
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital, git version'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake')
provides=('corsix-th')
conflicts=('corsix-th')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg' 'freepats-general-midi')
install=corsix-th.install
source=("git+https://github.com/CorsixTH/CorsixTH.git")

sha256sums=('SKIP')

pkgver() {
  cd "CorsixTH"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd CorsixTH

  cmake -DCMAKE_BUILD_TYPE=Release -Wno-dev \
        -DLUA_PROGRAM_PATH=/usr/bin/lua -DLUA_INCLUDE_DIR=/usr/include -DLUA_LIBRARY=/usr/lib/liblua.so \
        -DCMAKE_INSTALL_PREFIX=/usr .
  cd CorsixTH
  make
}

package() {
  make -C CorsixTH/CorsixTH DESTDIR="$pkgdir/" install
}
