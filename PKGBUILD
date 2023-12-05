# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Volume
pkgname=desq-utils-volume
pkgver=0.0.8
pkgrel=1
pkgdesc="Volume control for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'libcanberra' 'libpulse' 'libdesqui' 'dfl-settings' 'dfl-utils' 'dfl-applications' 'dfl-volume')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('48e1e050268ebd48c0eec884b1a03fe3')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
