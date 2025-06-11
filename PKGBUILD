# Maintainer: washedparu
pkgname=tinyprocess-git
pkgver="v0.0.2"
pkgrel=2
pkgdesc="A minimal process manager in C for Linux (Still in early development)"
arch=('x86_64')
url="https://github.com/washedparu/tinyprocess"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake' 'ninja' 'gcc')
source=("git+https://github.com/washedparu/tinyprocess.git")
md5sums=('SKIP')

# pkgver() {
#   cd "$srcdir/tinyprocess"
#   echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
# }

build() {
  echo "Listing srcdir contents before building:"
  ls -l "$srcdir"
  cd "$srcdir/tinyprocess" || exit
  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
  ninja -C build
}

package() {
  cd "$srcdir/tinyprocess"
  install -Dm755 build/tinyprocess "$pkgdir/usr/bin/tinyprocess"
}

