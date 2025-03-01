# Contributor: Daniel Mensinger <daniel@mensinger-ka.de>
# Maintainer: Rodolphe Houdas <rodolphe@lunai.re>
pkgname=mesh-git
pkgver=r1129.d45d6de
pkgrel=1
pkgdesc='A memory allocator that automatically reduces the memory footprint of C/C++ applications. '
arch=('x86_64')
url='https://github.com/plasma-umass/Mesh'
license=('Apache')
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(mesh)
conflicts=()
replaces=()
options=()
source=("$pkgname::git+https://github.com/plasma-umass/Mesh.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/include/plasma"
  make PREFIX="$pkgdir/usr" LDCONFIG="" install
}
