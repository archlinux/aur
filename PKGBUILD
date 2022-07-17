# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-desktop-view-git
pkgver=1.2.r0.g1f30d69
pkgrel=1
pkgdesc="The official Budgie desktop icons implementation - latest git"
arch=('x86_64')
url="https://github.com/BuddiesOfBudgie/budgie-desktop-view"
license=('Apache-2.0')
depends=(budgie-desktop)
makedepends=(meson git gobject-introspection intltool vala gtk-doc)
provides=(budgie-desktop-view)
conflicts=(budgie-desktop-view)
source=("$pkgname"::"git+https://github.com/BuddiesOfBudgie/budgie-desktop-view.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/^v([^-]*)-([^-]*)-/\1.r\2./'
}

build() {
  cd "$pkgname"
  meson build --prefix=/usr --sysconfdir=/etc --buildtype=plain
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="${pkgdir}" ninja -C build install
}
