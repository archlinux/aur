# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_name=draco
pkgname=${_name}-3d
pkgver=1.5.9
pkgrel=1
pkgdesc="Draco is a library for compressing and decompressing 3D geometric meshes and point clouds. It is intended to improve the storage and transmission of 3D graphics."
arch=('x86_64')
url="https://google.github.io/draco/"
license=('Apache-2.0')
makedepends=('cmake' 'git')
depends=('glibc' 'libstdc++' 'libgcc')

source=("git+https://github.com/google/draco.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_name}"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on \
    -DBUILD_WITH_STATIC_CRT=off
  make
}

package() {
  cd "${srcdir}/${_name}/build"
  DESTDIR="${pkgdir}" make install
}
