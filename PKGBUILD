
# Maintainer: aserdevyt <aserdevyt@outlook.com>
pkgname=ash-shell-git
pkgver()
{
  cd "$srcdir/ash-shell"
  # Use last tag and commit count, fallback to commit hash if no tag
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/./g' ||
    echo "0.0.$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="A modern, secure, feature-rich Linux shell written in C"
arch=('x86_64')
url="https://github.com/aserdevyt/ash-shell"
license=('GPL3')
depends=('readline')
makedepends=('git' 'cmake' 'gcc')
source=("git+https://github.com/aserdevyt/ash-shell.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/ash-shell"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "$srcdir/ash-shell/build"
  install -Dm755 ash "$pkgdir/usr/bin/ash"
}
