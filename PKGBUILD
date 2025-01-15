# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=inotify
pkgbase=dfl-inotify
pkgname=(
        'dfl-inotify'
        'dfl-inotify-qt6'
)
pkgver=0.2.0
pkgrel=2
pkgdesc="A Qt wrapper around inotify"
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
sha256sums=('2344f211254f3af08d699910e3e8c5475187bed85a048cd399b7c922f6240cb5')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-inotify() {
  depends=('qt5-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-inotify-qt6() {
  depends=('qt6-base')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
