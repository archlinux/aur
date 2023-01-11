# Maintainer: RRRRRm <isxiongzj@gmail.com>
pkgname=beslyric-for-x-git
pkgver=v3.2.0.r2.g8b06a38
pkgrel=3
pkgdesc="An simple but useful lyrics generator, mainly for Netease Cloud Music."
arch=('i686' 'x86_64')
url="https://github.com/Beslyric-for-X/Beslyric-for-X"
license=('GPL')
depends=('qt5-base' 'ffmpeg<5.0.0' 'sdl2' 'openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/BesLyric-for-X/BesLyric-for-X.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake Beslyric-for-X.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir" install
}
