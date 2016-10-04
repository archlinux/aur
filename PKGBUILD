pkgname=osvr-vive-libre-git
pkgver=0.2.127.68fbc21
pkgrel=1
pkgdesc="Free Software HTC Vive Driver for OSVR"
arch=('x86_64')
url="https://github.com/lubosz/OSVR-Vive-Libre"
license=('LGPLv3+')
makedepends=('git' 'cmake')
depends=('osvr-core-git' 'zlib' 'hidapi' 'jsoncpp' 'opencv' 'eigen')
source=("git+https://github.com/collabora/OSVR-Vive-Libre.git")
md5sums=('SKIP')


subver() {
  PREFIX="set (org_osvr_Vive_Libre_VERSION_$1"
  echo $(grep "$PREFIX" CMakeLists.txt | eval sed "'s/$PREFIX//'" | sed 's/)//')
}
 
pkgver() {
  cd "$srcdir/osvr-vive"
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(subver MAJOR).$(subver MINOR).$revision.$hash
}

build() {
  cd OSVR-Vive-Libre
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    .
  make
}

package() {
  cd OSVR-Vive-Libre
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
