# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=corrosion-git
pkgver=0.4.3.r116.gfcd8b41
pkgrel=1
pkgdesc="Integrate Rust into existing CMake projects"
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/AndrewGaspar/corrosion"
license=('MIT')
depends=('rust' 'cmake')
makedepends=('git')
provides=('corrosion')
conflicts=('corrosion')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCORROSION_BUILD_TESTS=OFF -B build -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
