# Contributor: Frank Tang <roadtang@gmail.com>
# Maintainer: Bink

pkgname=hashlink-git
pkgver=1.15.r180.g5d572cf8
pkgrel=1
pkgdesc="A virtual machine for Haxe"
arch=('x86_64' 'aarch64')
url="https://hashlink.haxe.org/"
license=('MIT')
depends=(
	'glu'
	'libjpeg-turbo'
	'libpng'	
	'libuv'
	'libvorbis'
	'mbedtls'
	'openal'
	'sdl2'	
	'sqlite'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('hashlink-git::git+https://github.com/HaxeFoundation/hashlink.git')
sha256sums=('SKIP')

pkgver() {
	#printf "r%s.%s" "$(git -C ${pkgname%-VCS} rev-list --count HEAD)" "$(git -C ${pkgname%-VCS} rev-parse --short HEAD)"
	git -C ${pkgname%-VCS} describe --tags --exclude latest | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-VCS}" || exit
	make
}

package() {
	cd "$srcdir/${pkgname%-VCS}" || exit
	make PREFIX="$pkgdir/usr" install
}
