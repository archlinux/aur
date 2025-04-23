# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=DesQDocs
pkgname=desq-apps-docs
pkgver=0.0.9
pkgrel=1
pkgdesc="A simple Document Viewer for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQApps/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'poppler-qt6'
        'qdocumentview'
        'libdesqui'
        'dfl-applications'
        'dfl-settings'
        'dfl-utils'
        'dfl-xdg'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/DesQApps/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('dd40f48ca7600c73b647d2dc2b76fda527831993b2b271814bd9ad65a04541e0')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
