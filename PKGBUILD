# Maintainer: Tobias Martin <tm-x at gmx dot net>

_pkgname=openboardview
__pkgname=OpenBoardView
pkgname=${_pkgname}-git
pkgver=r532.9fc1822
pkgrel=1
pkgdesc="Linux SDL/ImGui edition software for viewing .brd files"
arch=('i686' 'x86_64')
url="http://openboardview.org/"
license=('MIT')
depends=('sdl2' 'fontconfig' 'sqlite' 'gtk3')
makedepends=('git' 'cmake' 'sdl2' 'zlib' 'gtk3' 'fontconfig' 'sqlite' 'libpng')
source=("${pkgname}::git+https://github.com/${__pkgname}/${__pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  ./build.sh
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}"/usr/bin
  install -D -m755 bin/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m755 utilities/bvconv.sh "${pkgdir}/usr/bin/bvconv"

  mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
