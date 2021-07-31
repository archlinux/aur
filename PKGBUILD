# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=textpieces-git
_pkgname=textpieces
pkgver=1.3.1.r95.g373a43d
pkgrel=1
pkgdesc="Small tool for quick text transformations such as hashes, encoding, decoding and so on"
arch=('x86_64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('gtk4' 'json-glib' 'libadwaita' 'python-pyaml' 'gtksourceview4' 'libhandy' 'python' 'python-gobject')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "${pkgname%-git}" build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}