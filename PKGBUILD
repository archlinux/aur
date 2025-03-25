# Contributor: Frank Tang <roadtang@gmail.com>
# Maintainer: Bink

pkgname=hashlink-git
pkgver=1.15
pkgrel=1
pkgdesc="A virtual machine for Haxe"
arch=(any)
url="https://hashlink.haxe.org/"
license=('MIT')
depends=('libpng' 'libjpeg-turbo' 'libvorbis' 'openal' 'sdl2' 'mbedtls' 'libuv' 'glu' 'sqlite')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('hashlink-git::git+https://github.com/HaxeFoundation/hashlink.git')
md5sums=('SKIP')

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
	make PREFIX="$pkgdir/usr/" install
}
