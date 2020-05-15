# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libuinputplus
pkgver=0.1.4
pkgrel=2
pkgdesc="Easy-to-use uinput library in C++"
url="https://github.com/YukiWorkshop/libuInputPlus"
license=('MIT')
arch=('x86_64')
source=("$url/archive/v$pkgver.tar.gz"
        "$url/commit/70007571963792487064f4b57bdbe5694283ef97.patch")
sha256sums=('a537e156d11ad00c643b93cbd9b712d3ec9d0ae8e40731ff763fe9a6ffe97458'
            'c7476024f241c4e80116c72ebd85f0b722152beef2e96b402702ea80f7c61666')
makedepends=('cmake' 'ninja')

prepare() {
  cd "libuInputPlus-$pkgver"
  patch -sp1 -i ../70007571963792487064f4b57bdbe5694283ef97.patch
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S "libuInputPlus-$pkgver" -B build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
