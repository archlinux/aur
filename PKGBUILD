# Maintainer: Frederiuc Bezies <fredbezies at gmail dot com>
# Contributor: Benjamin Hodgetts <ben@xnode.org>

_gitname=fs-uae
pkgname=fs-uae-git
pkgver=r2703.80f74628
pkgrel=1
pkgdesc="Cross-platform Amiga emulator based on UAE/WinUAE (GIT version)."
arch=("i686" "x86_64")
url="http://fs-uae.net/download-devel"
license=("GPL2")
depends=('sdl2_ttf' 'portmidi' 'libmpeg2' 'hicolor-icon-theme' 'openal' 'libxi')
makedepends=('zip')
source=("git+https://github.com/FrodeSolheim/fs-uae.git")
provides=("fs-uae" "fs-uae-devel")
conflicts=("fs-uae" "fs-uae-devel")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_gitname}
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd ${_gitname}
	make install DESTDIR="${pkgdir}"
}
