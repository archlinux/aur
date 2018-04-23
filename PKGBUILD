# Maintainer: Benjamin Hodgetts <ben@xnode.org>

_gitname=fs-uae
pkgname=fs-uae-git
pkgver=r1272.a48fa6c0
pkgrel=1
pkgdesc="Cross-platform Amiga emulator based on UAE/WinUAE (GIT version)."
arch=("i686" "x86_64")
url="http://fs-uae.net/download-devel"
license=("GPL2")
depends=("sdl2" "libpng" "openal" "mesa" "glew" "libmpeg2" "gettext" "freetype2" "hicolor-icon-theme" "desktop-file-utils" "shared-mime-info")
source=("git+https://github.com/FrodeSolheim/fs-uae.git")
provides=("fs-uae" "fs-uae-devel")
conflicts=("fs-uae" "fs-uae-devel")
md5sums=('SKIP')


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
