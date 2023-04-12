# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miniupnpc-git
pkgver=2.2.4.r30.ge439318
pkgrel=1
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices (git)"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
depends=('glibc' 'sh')
makedepends=('git')
provides=("miniupnpc=$pkgver")
conflicts=('miniupnpc')
options=('staticlibs')
source=("git+https://github.com/miniupnp/miniupnp.git")
sha256sums=('SKIP')


pkgver() {
  cd "miniupnp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^miniupnpc_[0-9_]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^miniupnpc_//;s/_/./g'
}

build() {
  cd "miniupnp/miniupnpc"

  make
}

check() {
  cd "miniupnp/miniupnpc"

  make check
}

package() {
  cd "miniupnp/miniupnpc"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/miniupnpc"
}
