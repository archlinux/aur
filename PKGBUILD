pkgname=dgengine-physfs-git
pkgver=1
pkgrel=1
pkgdesc="PhysicsFS with MPQ files support"
arch=('i686' 'x86_64')
url="https://github.com/dgengin/physfs"
license=('ZLIB')
depends=('zlib')
makedepends=('cmake' 'git')
source=("${pkgname}::git+https://github.com/dgengin/physfs.git")
sha1sums=('SKIP')
provides=("physfs")
conflicts=("physfs")

build() {
  mkdir build
  cd build
  cmake ../${pkgname} -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPHYSFS_BUILD_TEST=OFF
  make all
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/physfs
}
