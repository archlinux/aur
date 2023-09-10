pkgname=gravity_defied_cpp-git
pkgver=0.1
pkgrel=1
pkgdesc='Disassembled legendary game "GravityDefied" translated into C++'
arch=('any')
url="https://github.com/rgimad/gravity_defied_cpp"
license=('GPLv2')
provides=('gravity_defied_cpp')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf')
makedepends=('git' 'cmake')

source=("git+https://github.com/rgimad/gravity_defied_cpp.git")
sha256sums=('SKIP')

pkgver() {
  cd gravity_defied_cpp
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -S gravity_defied_cpp -B build -DCMAKE_BUILD_TYPE="Release"
  make --directory build
}

package() {
  cd build
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/build/GravityDefied $pkgdir/usr/bin
}
