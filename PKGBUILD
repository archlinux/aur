# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=unvpk-git
pkgver=r108.1f1f44f
pkgrel=2
pkgdesc='Extract Valve VPK archives'
arch=(x86_64)
url='https://github.com/panzi/unvpk'
license=(LGPL-2.1-or-later)
depends=(glibc gcc-libs fuse boost-libs)
makedepends=(git cmake boost)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev -DCMAKE_BUILD_TYPE='None' -S "unvpk"
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et
