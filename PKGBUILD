# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=OpenMRac
pkgname="${_pkgname,,}-git"
pkgver=1.0
pkgrel=1
pkgdesc='OpenMRac, a split-screen racing game'
arch=('x86_64' 'aarch64')
url="https://github.com/Franticware/${_pkgname}"
license=('BSD')
depends=('openmrac-data' 'sdl' 'sdl_image' 'openal')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19fa7e74f4f09501c61ee79c72ae5ba09399f6001453ef3703087195db4e6f46')
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
  install -Dm755 ${_pkgname,,} "${pkgdir}/usr/bin/${_pkgname,,}"
  install -Dm644 ${_pkgname,,}.ico "${pkgdir}/usr/share/pixmaps/${_pkgname,,}.ico"
  install -Dm644 ${_pkgname,,}.desktop "${pkgdir}/usr/share/applications/${_pkgname,,}.desktop"
  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname,,}/LICENSE"
}
