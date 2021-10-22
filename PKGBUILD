# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=unvpk-git
pkgver=r108.1f1f44f
pkgrel=1
pkgdesc="Extract Valve VPK archives"
arch=('x86_64')
url="https://github.com/panzi/unvpk"
license=('LGPL')
depends=('fuse' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("unvpk::git+https://github.com/panzi/unvpk.git")
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev -DCMAKE_BUILD_TYPE='None' -S "unvpk"
	make -C build
}

package() {
#	cd "$srcdir/${pkgname%-git}"
	make -C build DESTDIR="$pkgdir" install
}
