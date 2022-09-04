_pkgname=yapsit
pkgname=${_pkgname}-git
pkgver=r32.58c50c9
pkgrel=1
pkgdesc="Yet Another Pokémon Sprite In your Terminal"
url="https://github.com/tomKPZ/yapsit"
arch=("x86_64")
depends=("glibc")
makedepends=("cmake" "git" "python-pillow")
license=('GPL3')

source=("git+https://github.com/tomKPZ/yapsit.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/${_pkgname}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
