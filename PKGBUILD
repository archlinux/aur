# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
_pkgname=Vaults
pkgver=0.2.0
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'fuse3' 'gocryptfs' 'cryfs')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=("${url}/archive/${pkgver}.tar.gz")
b2sums=('8827a1cbd12c7f17f1e41d2fb1460d33cc0566d0a5098904c48cf3359e8dfcb3228fa453805ca66f5e7755300e9acae38141356700a6e4e94979a51af593b8f4')

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
