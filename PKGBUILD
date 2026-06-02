# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: daf666

_pkgname=phototonic
pkgname="${_pkgname}"-git
pkgver=3.2.0.r2.g821c613
pkgrel=1
pkgdesc='Image Viewer and Organizer'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/luebking/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'exiv2' 'desktop-file-utils' 'gtk-update-icon-cache')
optdepends=('qt6-imageformats: TIFF and TGA support' 'qt6-svg: SVG support')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed "s/^v//;s/-/.r/;s/-/./"
}

build() {
  rm -Rf build && mkdir build
  cd build
  qmake6 ../${_pkgname} PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="${pkgdir}" install
}
