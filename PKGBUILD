# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxo-git
pkgver=1.7.5.r0.gfd5db1b
pkgrel=1
pkgdesc="A library for generating Text, XML, JSON, and HTML output"
arch=('i686' 'x86_64')
url="https://github.com/juniper/libxo"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git')
optdepends=('perl' 'sh')
provides=("libxo=$pkgver" 'libxo.so')
conflicts=('libxo')
options=('staticlibs')
source=("git+https://github.com/Juniper/libxo.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxo"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libxo"

  sh bin/setup.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libxo"

  #make check
}

package() {
  cd "libxo"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libxo"
}
