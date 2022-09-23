# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.37
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make' 'git')
optdepends=('python: For Conan python package manager.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ac652be0552fcb53a1163c08c1f28f29f0756594fcc587eebb4d8b363153709')
b2sums=('c4db13e0b6df33786211cb2c1b4b0a4cdac93e465e786e5c1837f5eb68b2725e89ca6c3f129a0237a8a3974a446df6155a28fa55a0b04b03a62c63eeca610fee')

build() {
  rm -rf build
  cmake -B build -S "$pkgname-$pkgver" \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PHMAP_BUILD_TESTS=ON \
    -D PHMAP_BUILD_EXAMPLES=OFF

  make -C build
}

check() {
  cmake --build build --target test
}

package() {
  cmake --install build --prefix "$pkgdir/usr"
}
