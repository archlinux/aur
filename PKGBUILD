pkgname=nexus4-git
pkgver=4.1.1.r1.506bb0f
pkgrel=1
pkgdesc="C++ based interpreter for the Nexus-Titan language"
arch=('x86_64' 'aarch64')
url="https://github.com/Nexus-Titan/Nexus-the-programming-language"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'gcc')
provides=('nexus4')
conflicts=('nexus4')
source=("git+https://github.com/Nexus-Titan/Nexus-the-programming-language.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Nexus-the-programming-language"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^V//'
}

build() {
  cd "$srcdir/Nexus-the-programming-language"
  g++ -O3 -o nexus4 interpreter.cpp
}

package() {
  cd "$srcdir/Nexus-the-programming-language"
  install -Dm755 nexus4 "$pkgdir/usr/bin/nexus4"
}
