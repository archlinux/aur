# Maintainer: willemw <willemw12@gmail.com>

pkgname=podget-git
pkgver=1.0.0.r0.g18892c6
pkgrel=1
pkgdesc='Simple tool to automate downloading of podcasts'
arch=(any)
#url=https://podget.sourceforge.net
url=https://github.com/dvehrs/podget
license=(GPL-3.0-or-later)
makedepends=(git)
depends=(wget)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 $pkgname/README -t "$pkgdir/usr/share/${pkgname%-git}"
  cp -a $pkgname/SCRIPTS/ "$pkgdir/usr/share/${pkgname%-git}/scripts/"

  make -C $pkgname prefix=/usr DESTDIR="$pkgdir/" install
}
