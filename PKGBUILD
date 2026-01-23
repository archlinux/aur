pkgname=bsh-git
pkgver=r49.96a8047
pkgrel=1
pkgdesc="A bad shell written in C++"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/simon0302010/bsh"
license=('GPL-3.0-only')

depends=('readline')
makedepends=('git' 'cmake')

provides=('bsh')
conflicts=('bsh')

source=("git+https://github.com/simon0302010/bsh.git")
sha256sums=('SKIP')

_pkgname=bsh

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 build/bsh "${pkgdir}/usr/bin/bsh"
}
