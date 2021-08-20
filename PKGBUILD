pkgname=supermariowar-git
pkgdesc='Super Mario War: A fan-made multiplayer Super Mario Bros. style deathmatch game'
pkgver=1259
pkgrel=1
arch=(x86_64)
url=https://github.com/mmatyas/supermariowar
makedepends=( cmake )
depends=( sdl sdl_image sdl_mixer zlib yaml-cpp enet )
source=( "git+$url" )
sha1sums=(SKIP)

pkgver() {
	cd "${pkgname%-git}"
	git rev-list --count HEAD
}

build() {
	cd "${pkgname%-git}"
	mkdir -p build && cd build
	cmake .. -DBUILD_STATIC_LIBS=OFF
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "${pkgname%-git}/build/Binaries/Release/"* "$pkgdir/usr/bin"
}
