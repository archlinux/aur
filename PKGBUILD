# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lorem-git
pkgver=r22.27dbbcd
pkgrel=1
pkgdesc="Simple app to generate the Lorem Ipsum placeholder text"
arch=('any')
url="https://gitlab.gnome.org/World/design/lorem"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('git' 'meson' 'rust')
source=(git+$url.git)
md5sums=(SKIP) #autofill using updpkgsums

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
