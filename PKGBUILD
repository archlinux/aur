# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=Keyring
pkgname=desq-utils-keyring
pkgver=0.0.9
pkgrel=1
pkgdesc="SSH Ask Pass and Polkit Daemon for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'libdesqui'
        'polkit-qt6'
        'dfl-wayqt'
        'dfl-settings'
        'dfl-keyring'
        'dfl-applications'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('214b952d8ddacc460e259df701a45f950e66ba0232a128baec61319af5afe6cd')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
