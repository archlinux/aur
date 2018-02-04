# Maintainer : Alexandre Janniaux <alexandre+aur@janniaux.me>
pkgname=nazara-engine-git
pkgdesc="Nazara engine is an open source C++14 game engine - git version"
pkgver=r4290.c2cdb6e2
pkgrel=1
arch=('x86_64')
license=('MIT')
url="https://github.com/DigitalPulseSoftware/NazaraEngine"
source=("git+https://github.com/DigitalPulseSoftware/NazaraEngine.git")
depends=('openal' 'libsndfile' 'libxcb' 'xcb-util-cursor' 'xcb-util-wm' 'xcb-util-keysyms' 'libx11' 'freetype2' 'assimp' 'libgl')
optdepends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
validpgpkeys=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/NazaraEngine"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/NazaraEngine/build"
	./premake5-linux64 gmake --excludes-examples --excludes-tests --with-extlibs
	make -C gmake config=releasedynamic_x64
	make -C gmake config=debugdynamic_x64
	./premake5-linux64 package
}

package() {
	cd "$srcdir/NazaraEngine"
	mkdir -p "$pkgdir/usr/share/licenses/NazaraEngine/"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib"
	cp -r LICENSE License-Cabin.txt "$pkgdir/usr/share/licenses/NazaraEngine"
	cp -r package/include/ "$pkgdir/usr"
	cp -r lib/gmake/x64/*.so "$pkgdir/usr/lib"
}
