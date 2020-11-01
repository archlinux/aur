# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=torrent-file-editor-qt5-git
_pkgname=torrent-file-editor
pkgver=0.3.17.r12.g6f8a201
pkgrel=1
pkgdesc="Qt based GUI tool designed to create and edit .torrent files. Qt5 build"
arch=('i686' 'x86_64')
url='https://torrent-file-editor.github.io'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'qt5-base')
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${_pkgname}" "${_pkgname}-qt5")
conflicts=("${_pkgname}" "${_pkgname}-qt4")
source=("git+https://github.com/torrent-file-editor/torrent-file-editor.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "${_pkgname}"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT5_BUILD=ON
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
