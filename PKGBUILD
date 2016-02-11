# Maintainer: Pablo Hernandez <pablo.hernandez.cerdan@protonmail.com>
# Upstream maintainer: Kevin Funk <kfunk@kde.org>
# https://github.com/icecc/icemon
# Built with version:
# 303d41fe82ba0c5ff5058b0aeb28c6dc96e27f88
pkgname=icemon-git
pkgver=0.r540.303d41f
pkgrel=1
# pkgver=303d41fe82ba0c5ff5058b0aeb28c6dc96e27f88
_gitname=icemon
pkgdesc="Icemon is an Icecream GUI monitor."
url="https://github.com/icecc/icemon"
license=('GPL2')
# makedepends=('icecream')
depends=('qt5-tools' 'cmake' 'icecream')
provides=('icemon')
conflicts=('icemon' 'icemon-git')
arch=('i686' 'x86_64')
source=("${_gitname}::git+https://github.com/icecc/icemon.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 _build_dir=${srcdir}/${_gitname}/build
  mkdir -p ${_build_dir}
  cd "${_build_dir}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
