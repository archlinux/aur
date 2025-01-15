# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=notification
pkgbase=dfl-notification
pkgname=(
        'dfl-notification'
        'dfl-notification-qt6'
)
pkgver=0.2.0
pkgrel=2
pkgdesc="Implementation of the XDG Desktop Notification Spec"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
makedepends=(
            'meson'
            'ninja'
            'qt5-base'
            'qt6-base'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('b8336c719dad5be75493f8cd00efc0e390db4b72eb7be7ad59a8daf217e29169')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-notification() {
  depends=('qt5-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-notification-qt6() {
  depends=('qt6-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
