pkgname=sdl2pp-git
_pkgname=sdl2pp
__pkgbuildname=libSDL2pp
pkgver=0.11.0.r15.560.g05325e1
pkgrel=1
pkgdesc="SDL2 wrapper for C++11"
arch=('i686' 'x86_64')
url="https://github.com/AMDmi3/libSDL2pp"
license=('zlib')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake' 'git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/libSDL2pp/libSDL2pp.git")
md5sums=('SKIP')

pkgver() {
cd "${__pkgbuildname}"
git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed "s/g/$(git rev-list --count HEAD).g/g"
}

build() {
  cd "${srcdir}/${__pkgbuildname}"
  cmake -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${__pkgbuildname}"
  make DESTDIR="${pkgdir}" install
}
