# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libevdevplus
pkgver=0.1.1
pkgrel=2
pkgdesc="Easy-to-use event device library in C++"
url="https://github.com/YukiWorkshop/libevdevPlus"
license=('MIT')
arch=('x86_64')
source=("$url/archive/v$pkgver.tar.gz"
        "$url/commit/7d4ff7dc76d135f2fab1c22fa3c2e11110d3507a.patch")
sha256sums=('c941b6b45f784c1e6c6f316f59256fabd604ac392db405cf7fd99de2686aaab0'
            '131ac2d9736b588818d024aee34bfa90703114ab6450164655c3f5d15a78c338')
makedepends=('cmake' 'ninja')

prepare() {
  cd "libevdevPlus-$pkgver"
  patch -sp1 -i ../7d4ff7dc76d135f2fab1c22fa3c2e11110d3507a.patch
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S "libevdevPlus-$pkgver" -B build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
