# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Keyring
pkgname=desq-utils-keyring
pkgver=0.0.8
pkgrel=2
pkgdesc="SSH Ask Pass and Polkit Daemon for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base'
        'libdesqui'
        'polkit-qt5'
        'dfl-wayqt'
        'dfl-settings'
        'dfl-keyring'
        'dfl-applications')
makedepends=('meson'
            'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('b2cbc9147cfc224783151eca15c60c8d')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
