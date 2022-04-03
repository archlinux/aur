# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
_pkgname=Vaults
pkgver=0.3.0
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'fuse3' 'gocryptfs' 'cryfs')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=("${url}/archive/${pkgver}.tar.gz")
b2sums=('044de61a1251ac2ef3f9e6234320b1c79d83fb635cad1b9aed56bf30e102283a223b13dc73ff3b42ac9dbf41c8c4aa65a8f52d5816eabf0474e16cc72ae7f241')

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
