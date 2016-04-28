# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=torrent-file-editor-qt4-git
_pkgname=torrent-file-editor
pkgver=v0.2.1.r28.g8462745
pkgrel=2
pkgdesc="Qt based GUI tool designed to create and edit .torrent files. Qt4 build"
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/torrent-file-editor/'
license=('GPL3')
depends=('qjson')
makedepends=('cmake' 'git')
provides=("${_pkgname}" "${_pkgname}-qt4")
conflicts=("${_pkgname}" "${_pkgname}-qt5")
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
    -DQT5_BUILD=OFF
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
