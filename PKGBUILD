# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
_name=libvarnam-ibus
pkgname="${_name}-git"
pkgver=r40.79ee71e
pkgrel=1
pkgdesc="Transliteration and reverse transliteration for Indian languages"
arch=('x86_64')
url="https://www.varnamproject.com/"
license=('Custom')
makedepends=('cmake')
source=("git+https://github.com/varnamproject/libvarnam-ibus.git")
sha256sums=('SKIP')
depends=(
  'libvarnam'
  'ibus'
)
provides=()

pkgver() {
  cd ${_name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_name}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    .
  make
}

package() {
  cd ${_name}
  make DESTDIR="$pkgdir/" install
}

