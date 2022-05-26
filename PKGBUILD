# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=extension-manager
pkgver=0.3.0
pkgrel=2
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'json-glib' 'text-engine')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('059d46118b57f204b1258a5d9c55587407130db3048b87be13294e6f426b5d8515475e6b7622cca3ed5951c3f2ed238d22a09ab4f4d1bf78196618b8fe580f29')

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
