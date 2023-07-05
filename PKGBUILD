# Maintainer: matt quintanilla <matt @ matt quintanilla . xyz>
pkgname=lemoa-git
pkgver=0.2.0.r97.e51da62
pkgrel=1
pkgdesc="Native Gtk client for Lemmy"
arch=(x86_64)
url="https://github.com/lemmygtk/lemoa"
license=(GPL3)
depends=(gtk4 libadwaita)
provides=(lemoa)
conflicts=(lemoa)
makedepends=(cargo git meson ninja)
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd lemoa
  printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd lemoa
  meson --prefix="/usr" _build
  ninja -C _build
}

package() {
  cd lemoa
  DESTDIR="${pkgdir}" ninja -C _build install
}
