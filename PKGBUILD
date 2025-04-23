# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=status-notifier
pkgname=('dfl-status-notifier')
pkgver=0.3.0
pkgrel=1
pkgdesc="Implementation of the XDG Status Notification Specifications"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=(
        'qt6-base'
        'libdbusmenu-lxqt'
)
makedepends=(
            'meson'
            'ninja'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('0447168a1c489caeb4163cbcd1d8adb06c05accd8fa8433390ea52bdb70318e6')

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
