# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=chiaki-git
_gitname=chiaki
pkgver=1.2.0.r0.gf3e9178
pkgrel=1
pkgdesc="Unofficial PlayStation 4 remote play client"
arch=(i686 x86_64)
url="https://github.com/thestr4ng3r/chiaki.git"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'sdl2' 'opus' 'ffmpeg' 'openssl' 'gcc-libs')
makedepends=('git' 'cmake' 'python-protobuf')
provides=('chiaki')
conflicts=('chiaki')
source=(git+"${url}")
md5sums=("SKIP")

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's:^v::;s:\([^-]*-g\):r\1:;s:-:.:g'
}

prepare() {
  cd ${_gitname}
  mkdir build
  git submodule update --init
}

build() {
  cd ${_gitname}/build
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="Release"
}

package() {
  cd ${_gitname}/build
  make DESTDIR="${pkgdir}" install
}
