# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=aribb24-git
pkgver=1.0.3.r5.g5e9be27
pkgrel=1
pkgdesc="A library for ARIB STD-B24, decoding JIS 8 bit characters and parsing MPEG-TS stream"
arch=('i686' 'x86_64')
url="https://github.com/nkoriyama/aribb24"
license=('LGPL-3.0-or-later')
depends=('glibc' 'libpng')
makedepends=('git')
provides=("aribb24=$pkgver")
conflicts=('aribb24')
options=('staticlibs')
source=("git+https://github.com/nkoriyama/aribb24.git")
sha256sums=('SKIP')


pkgver() {
  cd "aribb24"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "aribb24"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "aribb24"

  make check
}

package() {
  cd "aribb24"

  make DESTDIR="$pkgdir" install
}
