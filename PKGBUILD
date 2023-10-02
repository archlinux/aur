# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs-git
pkgver=3.0.2.r23.1c775d0
pkgrel=1
pkgdesc="A breadth-first version of find."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/tavianator/bfs"
license=('BSD')
groups=()
depends=('acl' 'libcap' 'liburing' 'oniguruma')
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
	make -k check
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make install DESTDIR="${pkgdir}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
