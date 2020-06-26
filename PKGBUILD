# Maintainer: Paul Yang <yangwenbo99@gmail.com>

pkgname=g3kb-switch-git
_pkgname=g3kb-switch
pkgver=20200108
pkgrel=1
pkgdesc='a keyboard layout switcher for Gnome 3'
arch=('x86_64')
url='https://github.com/lyokha/g3kb-switch'
license=('Unknown')
depends=('clang' 'glib2' 'glibc')
makedepends=("cmake" "git")
# source=('git+https://github.com/MaskRay/ccls.git')
source=('git+https://github.com/lyokha/g3kb-switch.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  TZ=UTC date -d @$(git log -1 --format=%ct) +%Y%m%d
}

prepare() {
  cd $_pkgname
  git submodule update --init
}

build() {
  cd $_pkgname
  # cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=clang++ -DCLANG_LINK_CLANG_DYLIB=on -DUSE_SYSTEM_RAPIDJSON=off
  # cmake --build build
  cmake -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
