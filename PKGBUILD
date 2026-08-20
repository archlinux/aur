# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=OpenMRac
pkgname="${_pkgname,,}"
pkgver=1.3
pkgrel=1
pkgdesc='OpenMRac, a split-screen racing game'
arch=('x86_64' 'aarch64')
url="https://github.com/Franticware/${_pkgname}"
license=('BSD')
depends=('openmrac-data' 'sdl2' 'openal' 'glm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf318012f04d130608f218799e3d35269c7964c2a28f5209a7414ec174fb20c3')
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
