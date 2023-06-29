# Maintainer: willemw <willemw12@gmail.com>
# Contributor: jfrankenau

pkgname=mergerfs-tools-git
pkgver=r115.ff4ef03
pkgrel=1
pkgdesc='Tools to help manage data in a mergerfs pool'
arch=(any)
url=https://github.com/trapexit/mergerfs-tools
license=(ISC)
makedepends=(git)
depends=(python-xattr)
optdepends=('rsync: for mergerfs.balance and mergerfs.dup')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  make -C $pkgname DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
