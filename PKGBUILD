# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs-git
pkgver=0.67.r1.32fdf4a
pkgrel=1
pkgdesc="A breadth-first version of find."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://tavianator.com/cgit/bfs.git/"
license=('custom:WTFPL')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('bfs::git+https://github.com/tavianator/bfs.git')
md5sums=('SKIP')
noextract=()

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	make
}

check() {
	cd "${srcdir}/${pkgname%-git}"
	make check
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make install DESTDIR="${pkgdir}"
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
}
