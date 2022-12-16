# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.0_rc.2
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'gtksourceview5' 'podman' 'vte4')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('d36d337bba236a2835305646e7f8fb8e67f1665b60b2d6c3c4ad0cdad20004154c7dd8c34b08807d93c1f7d3b8d77cc9866c9725e3eeca78ff38555b6c31baa7')

build() {
  arch-meson "$pkgname-${pkgver//_/-}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
