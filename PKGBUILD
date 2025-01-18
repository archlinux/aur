# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Keyring
pkgname=desq-utils-keyring
pkgver=0.0.8
pkgrel=3
pkgdesc="SSH Ask Pass and Polkit Daemon for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'libdesqui'
        'polkit-qt5'
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
sha256sums=('d42a8197700ed0c0ce7cd7a8d7ae4b3c8d99c6faf1e0216a8a050a18879d3ed7')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
