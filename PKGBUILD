# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
_pkgname=Vaults
pkgver=0.1.0
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('any')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('glib2' 'gtk4')
makedepends=('meson' 'rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

build() {
  arch-meson ${_pkgname}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}