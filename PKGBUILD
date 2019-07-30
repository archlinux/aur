# Maintainer: Christoph Haag <christoph.haag@collabora.com>

basename=kwin-effect-xrdesktop
pkgname=$basename-git
pkgver=r226.98bcdc7
pkgrel=1
pkgdesc='xrdesktop effect for KWin.'
arch=('x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/kwin-effect-xrdesktop'
license=('GPL')
depends=(kwin libinputsynth-git xrdesktop-git)
makedepends=('extra-cmake-modules' 'git')
source=('git+https://gitlab.freedesktop.org/xrdesktop/kwin-effect-xrdesktop.git')
md5sums=('SKIP')

pkgver() {
  cd $basename
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $basename
  mkdir -p build
}

build() {
  cd $basename/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS:STRING="" \
    -DCMAKE_CXX_FLAGS:STRING="" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="" \
    -DCMAKE_SHARED_LINKER_FLAGS:STRING="" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd $basename/build
  make DESTDIR="$pkgdir" install
}
