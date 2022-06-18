# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.34
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make' 'git')
optdepends=('python: For Conan python package manager.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('da4939f5948229abe58acc833b111862411d45669310239b8a163bb73d0197aa')
b2sums=('30629288656a22cfd56da9485458f604487383cc5951e230a833b182cbbcc706b78d0b8a45fb76c4fca6da930f49cdb79b2ca63926ca8cd60cc7445b58c8edbd')

build() {
  rm -rf build
  cmake -B build -S "${pkgname}-${pkgver}" \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PHMAP_BUILD_TESTS=ON

  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  cmake --install build --prefix "${pkgdir}/usr"
}
