# Maintainer: Alexandre Petitjean <alpetitjean@gmail.com>
pkgname=mopiqy-git
pkgver=0.1.1.r0.ed8a227
pkgrel=1
pkgdesc="Mopidy Qt client"
arch=('any')
url=""
license=('MIT')
groups=()
depends=('qt5-base' 'qt5-websockets')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/AlexandrePTJ/mopiqy.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -DBUILD_DESKTOP=ON
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
