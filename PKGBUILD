# Maintainer: Benjamin Hodgetts <ben@xnode.org>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Contributor: Daniel Varga <varga dot daniel at gmx dot de>

pkgname=emulationstation-ex-git
_gitname=EmulationStation
pkgrel=1
pkgver=1275.0928498
pkgdesc="A graphical front-end for emulators with controller navigation."
arch=('i686' 'x86_64')
url="https://github.com/RetroPie/EmulationStation"
license=('MIT')
makedepends=('git' 'boost' 'freetype2' 'eigen' 'cmake' 'mesa' 'libsm')
depends=('alsa-lib' 'sdl2' 'boost-libs' 'freeimage' 'ttf-dejavu' 'glu' 'vlc' 'libgl')
source=('git+https://github.com/RetroPie/EmulationStation.git' 'git+https://github.com/zeux/pugixml.git')
md5sums=('SKIP' 'SKIP')
provides=('emulationstation')
conflicts=('emulationstation')

pkgver() {
	cd ${srcdir}/${_gitname}
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"  
}

prepare() {
	cd ${srcdir}/${_gitname}
	git submodule init
	git config submodule.external/pugixml.url ${srcdir}/pugixml
	git submodule update
}

build() {
	cd "${srcdir}/${_gitname}"
	mkdir -p "${srcdir}/${_gitname}/build"
	cd "${srcdir}/${_gitname}/build"
	cmake ..
	make
}

package() {
	cd ${_gitname}
	install -Dm755 "${srcdir}/${_gitname}/emulationstation" "${pkgdir}/usr/bin/emulationstation"
}
