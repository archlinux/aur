# Maintainer: Frederik Schwan <freswa at archlinux dot org>

_pkgname=OpenBoardView
pkgname=${_pkgname,,}
pkgver=7.3
pkgrel=1
pkgdesc='Linux SDL/ImGui edition software for viewing .brd files'
arch=('i686' 'x86_64')
url='https://openboardview.org/'
license=('MIT')
depends=('sdl2' 'sqlite' 'zlib' 'fontconfig' 'gtk3' 'libpng')
makedepends=('git' 'cmake' 'python')
source=("git+https://github.com/OpenBoardView/OpenBoardView.git#tag=R${pkgver}")
b2sums=('SKIP')

build() {
  mkdir -p ${_pkgname}/build
  cd ${_pkgname}/build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${_pkgname}
  install -Dm755 build/src/openboardview/openboardview "${pkgdir}"/usr/bin/openboardview
  install -Dm755 utilities/bvconv.sh "${pkgdir}"/usr/bin/bvconv
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
