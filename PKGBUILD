# Maintainer: Your Name <youremail@domain.com>
pkgname=extension-manager
pkgver=0.2.1
pkgrel=1
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL3')
depends=('gtk4>=1:4.6.0' 'libadwaita' 'libsoup3' 'json-glib')
makedepends=('meson' 'blueprint-compiler-git' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('3083b8ba7523f57d8048466507db965a986119bcf45677dc545e985ff96c3c718d19f38d9c040310b0b14dd9e52ef4ed36a24e4a2e06951a8ab099466f5dbfc8')

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
