# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Git version: (Stable inherits everything, save pkgver and source, from Git)
#   Maintainer: Frederic Bezies <fredbezies@gmail.com>
#   Maintainer: Geert Custers <geert.aj.custers@gmail.com>
#   Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=glportal
pkgname=${_pkgname}
pkgver=0.0.7.2
pkgrel=1
epoch=1
pkgdesc="OpenGL puzzle game inspired by portal. Stable branch."
arch=('i686' 'x86_64')
url="http://glportal.de/"
license=('custom')
depends=('assimp' 'sdl2_mixer' 'tinyxml2' 'libepoxy' 'bullet' 'freeimage')
makedepends=('git' 'cmake' 'unittestpp')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}-git" "${_pkgname}-stable")
source=("git://github.com/${_pkgname}/${_pkgname}.git#branch=stable")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${_pkgname}"

  [[ -d build ]] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

# Disabled as recommended by developer
# check() {
#   cd $srcdir/$_pkgname/build
#
#   make test
# }

package() {
  cd $srcdir/$_pkgname/build
  
  make install DESTDIR=$pkgdir
  install -Dm644 $srcdir/$_pkgname/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
