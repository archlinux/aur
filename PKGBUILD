# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=Notifier
pkgname=desq-utils-notifier
pkgver=0.0.9
pkgrel=1
pkgdesc="Notification daemon for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'libdesq'
        'libdesqui'
        'qt6-svg'
        'dfl-applications'
        'dfl-settings'
        'dfl-utils'
        'dfl-inotify'
        'dfl-hjsonparser'
        'dfl-notification'
        'dfl-xdg'
        'dfl-wayqt'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('ae360c169de7615bf2733b7181aaa66e6421aaa7c81ba1012e2ff2cf1c0ea2c7')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
