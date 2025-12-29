# Maintainer: Darren Ng <`base64 -d <<<aGMwbWV1QG5hdmVyLmNvbQo=`>
pkgname=btcheck-svn
pkgver=r66
pkgrel=3
pkgdesc="Bittorrent downloaded data checker and a torrent file content viewer"
arch=($CARCH)
url="https://sourceforge.net/projects/btcheck/"
license=(GPL-3.0-or-later)
groups=()
depends=(glibc)
makedepends=(subversion)
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
replaces=()
backup=()
options=()
install=
source=(btcheck::svn+https://svn.code.sf.net/p/btcheck/code/trunk)
noextract=()
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir"/${pkgname%-svn}
	printf r%s "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir"/${pkgname%-svn}
}

build() {
	cd "$srcdir"/${pkgname%-svn}/${pkgname%-svn}
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/${pkgname%-svn}/${pkgname%-svn}
	make DESTDIR="$pkgdir/" install
}

