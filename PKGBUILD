# Maintainer: Your Name <youremail@domain.com>
pkgname=extension-manager
pkgver=0.1.0
pkgrel=4
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL3')
depends=('gtk4>=1:4.6.0' 'libadwaita' 'libsoup3' 'json-glib')
makedepends=('meson' 'blueprint-compiler-git' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('9a5a018eecd77fdae93313bf8d2e0f101fb3e599690fdb8c82762e4a993dd757939ea5effe7f66baffb6218235e1b40175a1c6e56c2bd8328e6c518044929db2')

build() {
  arch-meson "${pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
