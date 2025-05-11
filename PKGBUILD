# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=noscrypt-git
pkgver=0.1.9.r204.g6d3ef94
pkgrel=1
pkgdesc="A nostr specific cryptography library written in C"
arch=('x86_64' 'aarch64')
url="https://github.com/VnUgE/noscrypt"
license=('LGPL-2.1-or-later')
depends=('openssl' 'libsecp256k1')
makedepends=('cmake' 'git')
source=("${pkgname}::git+https://github.com/VnUgE/noscrypt.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
  mkdir -p ${pkgdir}/usr/include/
  mv ${pkgdir}/usr/noscrypt ${pkgdir}/usr/include/noscrypt
}
