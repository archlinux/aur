# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="c45bd41d5a350317f9507ace7bed4c635cfe319c"
pkgname=xmousepasteblock
pkgver=1.2
pkgrel=2
pkgdesc="Userspace tool to disable middle mouse button paste in Xorg"
arch=(i686 x86_64)
url="https://github.com/milaq/XMousePasteBlock"
license=(GPL)
conflicts=(xmousepasteblock-git)
depends=(libxi libx11 libev libxfixes)
makedepends=(git)
source=(
  "xmpb::git+https://github.com/milaq/XMousePasteBlock.git#commit=$_commit"
  xmousepasteblock.service
)
sha256sums=(
  "SKIP"
  "SKIP"
)

build() {
  cd xmpb
  make all
}

package() {
  cd xmpb
  make DESTDIR="$pkgdir/" install
  install -Dm644 \
    -t "$pkgdir/usr/lib/systemd/user/" \
    "$srcdir/xmousepasteblock.service"
}
