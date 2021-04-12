# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.32
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make')
optdepends=('python: For Conan python package manager.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('50cc7abc08f78c6396a33a334e5bc0b3ade121af8604690dae13a1bad47cf07c')
b2sums=('336d47cc14821e052bd0e0d87e4ceaf7d5af6daa1ed62cbe4a0994a6231a9a99a28d507b885291d58e60bb274f5077052c7905b817c14b5c7b463f1a652d787a')

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
