# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs
pkgver=3.0.1
pkgrel=1
pkgdesc="A breadth-first version of find."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tavianator.com/projects/bfs.html"
license=('BSD')
groups=()
depends=('acl' 'libcap' 'oniguruma')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tavianator/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a38bb704201ed29f4e0b989fb2ab3791ca51c3eff90acfc31fff424579bbf962')
noextract=()

build() {
	cd "${pkgname}-${pkgver}"
	make release CFLAGS="$CFLAGS"
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k release check CFLAGS="$CFLAGS"
}

package() {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
