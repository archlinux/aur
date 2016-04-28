# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=torrent-file-editor-qt5-git
_pkgname=torrent-file-editor
pkgver=v0.2.1.r28.g8462745
pkgrel=2
pkgdesc="Qt based GUI tool designed to create and edit .torrent files. Qt5 build"
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/torrent-file-editor/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'qt5-base')
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${_pkgname}" "${_pkgname}-qt5")
conflicts=("${_pkgname}" "${_pkgname}-qt4")
source=("git+https://github.com/drizt/torrent-file-editor.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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
