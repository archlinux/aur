pkgname=jellybean
pkgver=0.3.0
pkgrel=1
pkgdesc='Manage inventories of various things'
arch=('x86_64' 'aarch64')
url="https://codeberg.org/turtle/${pkgname}"
license=('AGPL3')
depends=('libadwaita' 'gtk4>=4.9.0' 'glib2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/${pkgver}.tar.gz")
b2sums=('f0574123b9ab7248ad8cb43450c87b18d90e0ca9ec49bce0adbf7a3c587ec9f514cd7f2ddc62b4e3227847a887b34d77b6534a7a453b69f4fd121379ab810f4e')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
