# Maintainer: Jishnu Mohan <jishnu7@gmail.com>

pkgname=fcitx5-m17n-git
pkgver=r95.02b11e7
pkgrel=1
pkgdesc="m17n input method for fcitx5"
arch=('x86_64')
url="https://gitlab.com/fcitx/fcitx5-m17n"
license=('LGPL 2.1+')
depends=('fcitx5-git' 'm17n-db' 'm17n-lib')
makedepends=('cmake' 'git' 'extra-cmake-modules')
provides=('fcitx5-anthy')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd fcitx5-m17n
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd fcitx5-m17n

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=/usr/lib .
	make
}

package() {
	cd fcitx5-m17n
	make DESTDIR="$pkgdir" install
}
