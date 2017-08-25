# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miniupnpc-git
pkgver=2.0.r121.g587f33c
pkgrel=1
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices (git)"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
depends=('glibc' 'sh')
makedepends=('git')
provides=('miniupnpc')
conflicts=('miniupnpc')
options=('staticlibs')
source=("git+https://github.com/miniupnp/miniupnp.git")
sha256sums=('SKIP')


pkgver() {
  cd "miniupnp"

  git describe --long --tags | sed 's/^miniupnpc_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
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
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/miniupnpc/LICENSE"
}
