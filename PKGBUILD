# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-web-shortcuts-extension-git
pkgver=r16.2d89c1e
pkgrel=2
pkgdesc="Research into making web shortcuts a 'first class citizen' in GNOME"
arch=('any')
url="https://gitlab.gnome.org/sthursfield/gnome-web-shortcuts-extension"
license=('unknown')
depends=('nautilus' 'firefox')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("git+https://gitlab.gnome.org/sthursfield/gnome-web-shortcuts-extension.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

# No tests defined
#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
