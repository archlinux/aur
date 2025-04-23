# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=notification
pkgname=('dfl-notification')
pkgver=0.3.0
pkgrel=1
pkgdesc="Implementation of the XDG Desktop Notification Spec"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('91ccc97234d63e7c3e4343e13e2bc17f4881e4359d5a7bca405861199753c295')

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
