# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pv-git
pkgver=1.8.5.r10.g1ad9c32
pkgrel=1
pkgdesc="Pipe Viewer is a terminal-based tool for monitoring the progress of data through a pipeline"
arch=('i686' 'x86_64')
url="https://www.ivarch.com/programs/pv.shtml"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("pv=$pkgver")
conflicts=('pv')
source=("git+https://codeberg.org/a-j-wood/pv.git")
sha256sums=('SKIP')


pkgver() {
  cd "pv"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "pv"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "pv"

  #make check
}

package() {
  cd "pv"

  make DESTDIR="$pkgdir" install
}
