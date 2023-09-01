_pkgname="overgrowth"
pkgname="overgrowth-game-git"
pkgver=r159.594a2a4f
pkgrel=2
pkgdesc="Open Source codebase of the game Overgrowth by Wolfire Games LLC"
arch=("x86_64")
url='https://github.com/WolfireGames/overgrowth'
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('cmake' 'gtk2')
depends=('sdl2_net')
source=("git+https://github.com/WolfireGames/overgrowth.git")
sha256sums=('SKIP')

__path_to_installed_game="/home/user/overgrowth_game/"

pkgver() {
	cd ${_pkgname}
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"	
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
