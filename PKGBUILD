# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=keyring
pkgname=('dfl-keyring')
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple and easy to use implementation of Keyring"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
optdepends=(
            'gnome-keyring: For Gnome integration'
            'kwallet6: For Plasma integration'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('a3b483c268a96e1bd4a6e91c8e538cf94ed4ad2a38de027e866b8095339aa172')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT6 version..."
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
