# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-desktop-view-git
pkgver=1.2.r0.g1f30d69
pkgrel=2
pkgdesc="The official Budgie desktop icons implementation - latest git"
arch=('x86_64')
url="https://github.com/BuddiesOfBudgie/budgie-desktop-view"
license=('APACHE')
depends=(budgie-desktop)
makedepends=(meson git gobject-introspection intltool vala gtk-doc)
provides=(budgie-desktop-view)
conflicts=(budgie-desktop-view)
source=("$pkgname"::"git+https://github.com/BuddiesOfBudgie/budgie-desktop-view.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//g'
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
