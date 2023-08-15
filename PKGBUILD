# Maintainer: Wesley Chan https://aur.archlinux.org/account/Wesley_Chan
# Maintainer: Zhirui Dai https://aur.archlinux.org/account/daizhirui
# Original authors: Sven-Hendrik Haase <sh@lutzhaase.com>, Markus Martin <markus@archwyrm.net>

pkgname=yaml-cpp-git
pkgver=r937.f732014
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gcc-libs')
conflicts=('yaml-cpp')
provides=('yaml-cpp')
makedepends=('boost' 'cmake' 'git')
source=(${pkgname}::git+https://github.com/jbeder/yaml-cpp.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir
    cmake -B build -S $pkgname -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DYAML_CPP_INSTALL=ON
    cmake --build build -- -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
