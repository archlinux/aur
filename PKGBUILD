# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=archivemount-git
pkgver=r78.78c3065
pkgrel=1
pkgdesc="FUSE filesystem using libarchive"
url="https://www.cybernoia.de/software/${pkgname%-git}.html"
arch=("i686" "x86_64")
license=("GPL2")
depends=(fuse2 libarchive)
makedepends=(git)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/cybernoid/archivemount.git")
sha512sums=('SKIP')


pkgver() {
	cd "${pkgname}"
	#git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	# Until Tags are available again
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"
	autoreconf -i
}

build() {
	cd "${pkgname}"
	./configure --prefix="/usr"
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}/" install install-man
}
