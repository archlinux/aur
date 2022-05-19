# Maintainer: Your Name <youremail@domain.com>

pkgname=mdwriter-git
pkgver=r26.796f36c
pkgrel=1
pkgdesc="Markdown Editor"
arch=('any')
url="https://gitlab.gnome.org/GabMus/mdwriter"
license=('GPL3')
depends=('glib2' 'libadwaita-git')
makedepends=('git' 'meson' 'gobject-introspection' 'blueprint-compiler-git')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
