# Maintainer: Your Name <you@example.com>
pkgname=powerls
pkgver=1.0.0
pkgrel=1
pkgdesc='A colorful terminal directory explorer written in C++20'
arch=('x86_64')
url='https://github.com/themazyworlds/powerls'
license=('MIT')
makedepends=('cmake' 'ninja')
depends=()
provides=('powerls')
conflicts=('powerls')
options=('!debug')
source=("https://github.com/themazyworlds/powerls/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  local src_root
  src_root=$(find "$srcdir" -maxdepth 1 -mindepth 1 -type d -name 'powerls*' | head -n1)
  cmake -S "$src_root" -B "$srcdir/build" -G Ninja -DCMAKE_BUILD_TYPE=Release
  cmake --build "$srcdir/build"
}

package() {
  install -Dm 0755 "$srcdir/build/powerls" "$pkgdir/usr/bin/powerls"
}
