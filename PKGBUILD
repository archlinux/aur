# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Disks
pkgname=desq-utils-disks
pkgver=0.0.8
pkgrel=2
pkgdesc="Disks Auto Mounter for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'hicolor-icon-theme'
        'libdesqui'
        'dfl-settings'
        'dfl-utils'
        'dfl-applications'
        'dfl-xdg'
        'dfl-storage'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('e80e1a748b3c88383e1693f069826c923970b23120f4b288bf46a019b763963e')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
