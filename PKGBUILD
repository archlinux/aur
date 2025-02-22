# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>

pkgname="pinfo-patched-git"
pkgver=0.6.13.r10.r0.gb6fd491
pkgrel=4
epoch="1"
pkgdesc="A hypertext info file viewer (patched bug-fix version)"
arch=("x86_64")
url="https://github.com/plp13/pinfo"
license=("GPL-2.0-only")
depends=("ncurses" "readline")
makedepends=("git")
provides=("pinfo")
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
  make DESTDIR="${pkgdir}" install
  install -D -m 644 "README.md" "${pkgdir}/usr/share/doc/pinfo/README.md"
}
