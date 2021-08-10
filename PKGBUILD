# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
_pkgname=Vaults
pkgver=0.1.0
pkgrel=2
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'fuse3')
makedepends=('meson' 'rust')
optdepends=('gocryptfs' 'cryfs')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cc59f9639244256378d7c06beaef901338891a5223a6d16f872ded60896eaab8')

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