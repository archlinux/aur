# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=icon-library-git
pkgver=0.0.12.r3.g0d08220
pkgrel=1
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/icon-library"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

