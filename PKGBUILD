# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pik-git
pkgver=r52.gce070d1
pkgrel=1
pkgdesc="A new lossy image format for the internet"
arch=('i686' 'x86_64')
url="https://github.com/google/pik"
license=('Apache')
depends=('glibc' 'libjpeg' 'libpng')
makedepends=('git')
provides=('pik')
conflicts=('pik')
source=("git+https://github.com/google/pik.git")
sha256sums=('SKIP')


prepare() {
  cd "pik"

  git submodule update --init --remote --recursive --depth 1
}

pkgver() {
  cd "pik"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "pik"

  make
}

package() {
  cd "pik"

  install -d "$pkgdir/usr"
  install -Dm755 "bin/cpik" "$pkgdir/usr/bin/cpik"
  install -Dm755 "bin/dpik" "$pkgdir/usr/bin/dpik"
}
