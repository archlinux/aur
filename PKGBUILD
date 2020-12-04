# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

pkgname=imhex-git
pkgver=1.4.0.r23.gd7af693
pkgrel=1
pkgdesc="A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM"
arch=('x86_64')
url="https://github.com/WerWolv/ImHex"
license=('GPL2')
depends=('glfw' 'glm' 'capstone' 'llvm-libs' 'llvm' 'nlohmann-json' 'python')
makedepends=('git' 'cmake')
optdepends=()
provides=('imhex')
conflicts=('imhex')
source=("$pkgname::git+https://github.com/WerWolv/ImHex.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd "$pkgname"

  install -DTm755 build/ImHex "${pkgdir}/usr/bin/imhex"
}
