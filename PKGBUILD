pkgname=lamina
pkgver=1.1.1
pkgrel=1
pkgdesc="一种专注于精确数学计算的面向过程编程语言"
arch=('x86_64')
url="https://github.com/Lamina-dev/Lamina"
license=('LGPL-2.1')
makedepends=('cmake' 'git')
depends=('libuv')
source=(
        "git+https://github.com/Lamina-dev/Lamina.git"
)
sha256sums=(
        'SKIP'
)

prepare() {
  cd Lamina
  git submodule update --init --recursive
}

build() {
  cd Lamina
  mkdir build
  cd build
  cmake ..
  cmake --build .
}

package() {
  cd Lamina/build
  install -Dm755 "Lamina" "$pkgdir/usr/bin/Lamina"
  install -Dm644 "lamina_core.so.1.0.0" "$pkgdir/usr/lib/lamina_core.so.1.0.0"
  install -Dm644 "ultra_minimal.so" "$pkgdir/usr/lib/ultra_minimal.so"
  
  ln -s lamina_core.so.1.0.0 "$pkgdir/usr/lib/lamina_core.so.1"
  ln -s lamina_core.so.1 "$pkgdir/usr/lib/lamina_core.so"
}
