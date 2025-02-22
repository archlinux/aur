# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>

pkgname="pinfo-patched-git"
pkgver="0.6.13.r9.r0.g5cb812b"
pkgrel="2"
epoch="1"
pkgdesc="A hypertext info file viewer (patched bug-fix version)"
arch=("x86_64")
url="https://github.com/plp13/pinfo"
license=("GPL")
depends=("ncurses" "readline")
makedepends=("git")
conflicts=("pinfo" "pinfo-git")
source=("git+https://github.com/plp13/pinfo.git")
sha256sums=("SKIP")

pkgver() {
  cd "pinfo"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "pinfo"
	[ -x configure ] || ./autogen.sh
	[ -f Makefile ] || ./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "pinfo"
	make DESTDIR="$pkgdir" install
}
