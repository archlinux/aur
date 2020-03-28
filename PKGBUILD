# Maintainer: encadyma <encadyma.hi at gmail dot com>

_pkgexec=usc-game
pkgname=unnamed-sdvx-clone
_pkgnum='0.4'
pkgver="v$_pkgnum"
pkgrel=2

pkgdesc="A game based on K-Shoot MANIA and Sound Voltex"
arch=('x86_64')
license=('MIT')
url="https://github.com/Drewol/unnamed-sdvx-clone"

depends=(freetype2 libogg libvorbis sdl2 zlib libpng libjpeg libarchive mesa openssl)
makedepends=(cmake git)

conflicts=(unnamed-sdvx-clone-git)

source=(
	"$pkgname::git+https://github.com/Drewol/unnamed-sdvx-clone.git#tag=$pkgver"
)

sha256sums=(
	"SKIP"
)

prepare() {
	cd "$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	cmake -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	install -d "$pkgdir/opt/$pkgname"
	cp -a "$pkgname/bin/." "$pkgdir/opt/$pkgname"

	# chmod 755 the executable
	chmod 755 "$pkgdir/opt/$pkgname/$_pkgexec"

	# Link the binary to /usr/bin
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$_pkgexec" "$pkgdir/usr/bin/$pkgname"
}
