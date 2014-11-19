pkgname=shaman-git
pkgver=0.r248.cb98a17
pkgrel=1

pkgdesc="A small, native C library and utility to fetch weather"
url="https://github.com/HalosGhost/shaman"
arch=('i686' 'x86_64')
license=('GPL2')

depends=('curl' 'jansson')
makedepends=('git' 'tup' 'clang')

source=('git+https://github.com/HalosGhost/shaman.git')
sha256sums=('SKIP')

pkgver () {
	cd shaman
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd shaman
	tup upd
}

check () {
	cd shaman/test
	LD_LIBRARY_PATH=../src ./suite
}

package () {
	cd shaman
	DESTDIR="$pkgdir" PREFIX='/usr' ./install.sh
}
