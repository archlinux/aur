# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bzip3-git
pkgver=1.2.2.r0.g7b45d73
pkgrel=1
pkgdesc="A better and stronger spiritual successor to BZip2"
arch=('i686' 'x86_64')
url="https://github.com/kspalaiologos/bzip3"
license=('apache' 'LGPL3')
depends=('glibc')
makedepends=('git' 'clang')
optdepends=('sh')
provides=("bzip3=$pkgver" 'libbzip3.so')
conflicts=('bzip3')
options=('staticlibs')
source=("git+https://github.com/kspalaiologos/bzip3.git")
sha256sums=('SKIP')


pkgver() {
  cd "bzip3"

  _tag=$(git tag -l --sort -v:refname | grep -E [\d\.]+ | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "bzip3"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "bzip3"

  make check
}

package() {
  cd "bzip3"

  make DESTDIR="$pkgdir" install
}
