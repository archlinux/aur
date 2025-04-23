# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=PowerManager
pkgname=desq-utils-powermanager
pkgver=0.0.9
pkgrel=1
pkgdesc="Power manager for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'hicolor-icon-theme'
        'libdesq'
        'dfl-wayqt'
        'dfl-settings'
        'dfl-login1'
        'dfl-power'
        'dfl-utils'
        'dfl-xdg'
        'dfl-applications'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('e2fef4739d10f6c56dd6dc877b897cdf2367a4836fd71d5a1e6161c4cce2e5a7')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
