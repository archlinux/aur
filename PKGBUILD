# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.0_beta.6
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'podman')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('4d90fded65cae36fb9040d9e89ae87c6868d62e99cd9e336f35a92834bbf6136eb3b7af2597f6b3f8cf7ec5840ebdcb9ebd1807697af98685585dc5b3c29d195')

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
