_pkgname="overgrowth"
pkgname="overgrowth-game-git"
pkgver=20230517.594a2a4
pkgrel=1
pkgdesc="Open Source codebase of the game Overgrowth by Wolfire Games LLC "
arch=("x86_64")
url='https://github.com/WolfireGames/overgrowth'
license=('Apache-2.0')
makedepends=('cmake')
depends=('sdl2_net')
source=("git+https://github.com/WolfireGames/overgrowth.git")
sha256sums=('SKIP')

__path_to_installed_game="/home/user/overgrowth_game/"

pkgver() {
	cd ${_pkgname}
    	git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
    	cd "${srcdir}/${_pkgname}"
    	[[ -d build ]] && rm -rf build
    	mkdir build && cd build

	cmake ../Projects -DAUX_DATA="${__path_to_installed_game}"
    	make
}

package() {
    	cd "${srcdir}/${_pkgname}/build"
    	install -d ${pkgdir}/usr/share/licenses/${pkgname}
    	make DESTDIR="${pkgdir}" install
}
