pkgname=cheeseburger
pkgver=1.0.3
pkgrel=1
pkgdesc="A lolcat clone in C++"
arch=('x86_64' 'aarch64')
url="https://git.lysator.liu.se/love/cheeseburger"
license=('BSD 3')
depends=('boost-libs')
makedepends=('cmake' 'boost' 'gcc' 'make' 'git')
source=("$pkgname::git+https://git.lysator.liu.se/love/cheeseburger.git#tag=v$pkgver")
sha256sums=('SKIP')  # Not needed for Git sources
options=('!debug')

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel 4
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
