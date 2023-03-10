# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=OpenMRac
pkgname="${_pkgname,,}"
pkgver=1.2
pkgrel=1
pkgdesc='OpenMRac, a split-screen racing game'
arch=('x86_64' 'aarch64')
url="https://github.com/Franticware/${_pkgname}"
license=('BSD')
depends=('openmrac-data' 'sdl2' 'sdl2_image' 'openal' 'glm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7a1ea8e74c43d406756f55c477c76dcd2476cbc55ddd0afc23ded3afaa3bf812')
conflicts=(${pkgname}-git)

prepare() {
  cd "${_pkgname}-${pkgver}/src"
  mv Makefile.linux Makefile
}

build() {
  cd "${_pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${_pkgname}-${pkgver}/src"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.ico "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
