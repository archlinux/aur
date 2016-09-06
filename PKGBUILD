# Maintainer: Tobias Martin <tm-x at gmx dot net>

_pkgname=openboardview
__pkgname=OpenBoardView
pkgname=${_pkgname}-git
pkgver=R5
pkgrel=1
pkgdesc="Linux SDL/ImGui edition software for viewing .brd files"
arch=('i686' 'x86_64')
url="http://openboardview.org/"
license=('MIT')
depends=('sdl2' 'fontconfig' 'sqlite')
makedepends=('git' 'cmake' 'sdl2' 'zlib' 'gtk3' 'fontconfig' 'sqlite' 'libpng')
source=("${pkgname}::git+https://github.com/inflex/${__pkgname}.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  ./build.sh
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/opt/${_pkgname}/"
  cp -dr --no-preserve=ownership {bin,utilities} "${pkgdir}/opt/${_pkgname}/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
