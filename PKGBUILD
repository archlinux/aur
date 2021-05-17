pkgname=kcolorpicker-git
pkgver=r69.17c0510
pkgrel=1
pkgdesc='Qt basd Color Picker with popup menu'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/kcolorpicker'
license=('GPL')
makedepends=(
  git
  extra-cmake-modules
  qt5-tools
)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
md5sums=(SKIP)

prepare(){
  cd ${pkgname%-git}
  test -d build || mkdir build
}
pkgver(){
  cd ${pkgname%-git}
  set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build(){
  cd ${pkgname%-git}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON ..
  make
}
package(){
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir" install
}

