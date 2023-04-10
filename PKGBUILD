# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pik-git
pkgver=r115.gbe30e6e
pkgrel=2
pkgdesc="A new lossy image format for the internet"
arch=('i686' 'x86_64')
url="https://github.com/google/pik"
license=('Apache')
depends=('glibc' 'libjpeg' 'libpng')
makedepends=('git')
provides=("pik=$pkgver")
conflicts=('pik')
source=("git+https://github.com/google/pik.git")
sha256sums=('SKIP')


prepare() {
  cd "pik"

  git submodule update --init --recursive
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
  install -Dm755 bin/{cpik,dpik} -t "$pkgdir/usr/bin"
}
