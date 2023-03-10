# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit='c45bd41d5a350317f9507ace7bed4c635cfe319c'
pkgname=xmousepasteblock
pkgver=1.2
pkgrel=1
pkgdesc="Userspace tool to disable middle mouse button paste in Xorg"
arch=(i686 x86_64)
url="https://github.com/milaq/XMousePasteBlock"
license=(GPL)
provides=(xmousepasteblock)
conflicts=(xmousepasteblock)
depends=(libxi libx11 libev libxfixes)
makedepends=(git)
source=(
  "xmpb::git+https://github.com/milaq/XMousePasteBlock.git#commit=$_commit"
  xmousepasteblock.service
)
sha256sums=(
  'SKIP'
  '6c2124ae92594d84ee58531c93820957356bd7f92236cd85fa8d6de6b554ede5'
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
