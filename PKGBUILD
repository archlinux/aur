pkgname=mold-git
pkgver=r2014.b19a487
pkgrel=2
pkgdesc='Fast linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=('unknown')
depends=(mimalloc xxhash)
makedepends=(clang cmake git)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd mold
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd mold
  git submodule update --init
}

build() {
  make -C mold submodules all
}

package() {
  install -Dm755 mold/mold "$pkgdir/usr/bin/mold"
}
