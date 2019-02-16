# Maintainer: Philip Jones <philj56@gmail.com>
pkgname='gbcc-git'
pkgver=r174.0b4b105
pkgrel=1
pkgdesc="A Game Boy Color emulator written in C"
arch=('x86_64')
url="https://github.com/philj56/GBCC"
license=('GPL')
groups=()
depends=('sdl2' 'libpng')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}")
noextract=()
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
        make clean
	make
}

package() {
	cd "${pkgname}"
        install -Dm755 gbcc "${pkgdir}/usr/bin/gbcc"
        install -Dm644 tileset.png "${pkgdir}/usr/share/games/gbcc/tileset.png"
}
