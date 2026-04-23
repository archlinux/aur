pkgname=channel-git
_pkgname=channel
pkgdesc="input config for river"
pkgver=96829ef
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Sivecano/channel"
license=('AGPLv3')
depends=('wayland' 'libxkbcommon')
makedepends=('zig>=0.16.0')
source=(git+$url.git)
sha512sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  DESTDIR="build" zig build \
    --prefix /usr \
    -Doptimize=ReleaseSafe
}

package() {
  cd "$srcdir/$_pkgname"
  cp -a build/* "$pkgdir"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
