# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=oglp-git
pkgver=r116.99543f0
pkgrel=1
pkgdesc="OpenGL wrapper for C++"
license=('GPL')
arch=('any')
url="http://github.com/ekpyron/oglp/"
depends=('glm')
makedepends=('git' 'python' 'cmake')
source=('git+git://github.com/ekpyron/oglp')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/oglp
  ./glcorew_gen.py

  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "${srcdir}/oglp/build"
  make install DESTDIR="${pkgdir}"
}
