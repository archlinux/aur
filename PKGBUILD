# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miniupnpc-git
pkgver=r60.ge7068a7
pkgrel=1
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices (git)"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
depends=('sh')
makedepends=('git')
source=("git+https://github.com/miniupnp/miniupnp.git")
sha256sums=('SKIP')


pkgver() {
  cd "miniupnp"

  git describe --long --tags | sed 's/[^-]*-\(.*\)/r\1/;s/-/./g'
}

build() {
  cd "miniupnp/miniupnpc"

  make
}

package() {
  cd "miniupnp/miniupnpc"

  make PREFIX="$pkgdir" install
  install -Dm644 "man3/miniupnpc.3" "$pkgdir/usr/share/man/man3/miniupnpc.3"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
