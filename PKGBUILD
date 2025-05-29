# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

_name=libvarnam-ibus
pkgname="${_name}-git"
pkgver=r40.79ee71e
pkgrel=3
pkgdesc="IBus engine for libvarnam providing Indian language input method"
arch=('x86_64')
url="https://www.varnamproject.com/"
license=('Custom')
makedepends=('cmake' 'git')
source=("git+https://github.com/varnamproject/libvarnam-ibus.git")
b2sums=('SKIP')
depends=('libvarnam' 'ibus')
provides=('libvarnam-ibus')

pkgver() {
  cd ${_name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_name}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_C_STANDARD=17 \
    .
  make
}

package() {
  cd ${_name}
  make DESTDIR="$pkgdir/" install
}
