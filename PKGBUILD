# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.35
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make' 'git')
optdepends=('python: For Conan python package manager.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('308ab6f92e4c6f49304562e352890cf7140de85ce723c097e74fbdec88e0e1ce')
b2sums=('18c4843ebd2ca046e1597a7fc0341440d888c4b39d2355e45b36e02b9f5dcf39baec1826434d70b591e6713fe2ff043a9ec8a68b7b43e0fbb2af176507b738ba')

build() {
  rm -rf build
  cmake -B build -S "${pkgname}-${pkgver}" \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PHMAP_BUILD_TESTS=ON \
    -D PHMAP_BUILD_EXAMPLES=OFF

  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  cmake --install build --prefix "${pkgdir}/usr"
}
