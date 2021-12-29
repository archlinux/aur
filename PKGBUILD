# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
_pkgname=Vaults
pkgver=0.2.1
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'fuse3' 'gocryptfs' 'cryfs')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=("${url}/archive/${pkgver}.tar.gz")
b2sums=('f4ff8e326d2904067db950a9390e689cfe7b28d7f385b85880e6041dc57dc3e427ca04d20aee4b670202134a4826c971696c022781254e7fde279046b7e78a94')

build() {
  arch-meson ${_pkgname}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
