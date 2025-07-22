# Maintainer: Your Name <you@example.com>

pkgname=uvdilate-git
pkgver=2025.7.r3.cdca15e
pkgrel=1
pkgdesc="A tool to dilate UV islands"
arch=('x86_64')
url="https://github.com/MattiRegenhardt/uvdilate"
license=('MIT')
depends=()
makedepends=('cmake' 'git' 'gcc' 'make')
provides=('uvdilate')
conflicts=('uvdilate')
source=("git+https://github.com/MattiRegenhardt/uvdilate.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/uvdilate"
  printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 HEAD)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/uvdilate"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
  strip build/uvdilate
}

package() {
  cd "$srcdir/uvdilate"
  install -Dm755 build/uvdilate "$pkgdir/usr/bin/uvdilate"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
