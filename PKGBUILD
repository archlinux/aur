# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: benpiano800 <benpiano800@protonmail.com>

_pkgname=libcpufeatures
pkgname="${_pkgname}"
pkgver=0.11.0
pkgrel=1
pkgdesc="A cross-platform C library to retrieve CPU features (such as available instructions) at runtime."
url="https://github.com/google/cpu_features"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('glibc')
makedepends=('cmake' 'git' 'gtest')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}-git")

source=("${_pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake "${srcdir}/${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF
}

build() {
  cd "${srcdir}/build"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

