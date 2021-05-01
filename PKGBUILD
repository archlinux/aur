# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.33
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make' 'git')
optdepends=('python: For Conan python package manager.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f6e4d0508c4d935fa25dcbaec63fbe0d7503435797e275ec109e8a3f1462a4cd')
b2sums=('b704a0230bd6d15e8a3a1aa11bec456183119d5104e1ac191e556edae1c0b0d2a27c5b52c84cae167cd09a90f4fc43f817c21d64d6b288a70596b6495ee872e6')

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
