# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgbase=st
pkgname=auto-st
pkgver=0.8.5.r18
pkgrel=1
pkgdesc="Concise Build of Suckless Simple Terminal"
arch=('x86_64')
url="https://gitlab.com/a4to/${_pkgbase}"
license=('MIT')
options=('zipman')
depends=('libxft' 'ttf-hack')
makedepends=('ncurses' 'libxft' 'git')
optdepends=(
    'dmenu: feed urls to dmenu'
    'libcurl: for curl'
  )
provides=(st)
conflicts=(st)
source=("git+$url.git")
md5sums=('SKIP')

prepare() {
	cd $srcdir/${_pkgbase}
	sed -i '/tic /d' Makefile
}

build() {
	cd "${_pkgbase}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgbase}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 Xappearance.h "${pkgdir}/usr/share/doc/${pkgname}/Xdefaults.example"
}
