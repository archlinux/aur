# Maintainer: Mark Wagie <mark.wagie at tutanota dot com>
pkgname=sticky-git
pkgver=1.2.r21.g6d6b1ce
pkgrel=1
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/collinss/sticky"
license=('GPL')
depends=('gtk3' 'gspell' 'python-gobject' 'python-xapp' 'xapps')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/collinss/sticky.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make buildmo
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cp -r etc usr "$pkgdir"
  chmod +x "$pkgdir/usr/bin/${pkgname%-git}"
}
