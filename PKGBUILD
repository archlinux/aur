# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=turbobench-git
pkgver=r849.g1995988
pkgrel=1
pkgdesc="Compressor benchmark program"
arch=('i686' 'x86_64')
url="https://github.com/powturbo/TurboBench"
license=('GPL2')
depends=('gcc-libs')
makedepends=('git')
provides=('turbobench')
conflicts=('turbobench')
source=("git+https://github.com/powturbo/TurboBench.git")
sha256sums=('SKIP')


prepare() {
  cd "TurboBench"

  git submodule update --init
}

pkgver() {
  cd "TurboBench"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "TurboBench"

  make
}

package() {
  cd "TurboBench"

  install -Dm755 "turbobench" -t "$pkgdir/usr/bin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/turbobench"
}
