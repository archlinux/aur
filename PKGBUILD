# Maintainer: MeaTLoTioN <ml@erb.pw>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Michael Wawrzyniak <arch ismyusernameat cmstactical nexttothecomma net>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=syncterm-git
pkgver=1.3.r0.g4b05587
pkgrel=1
pkgdesc="A BBS terminal program, supporting ANSI music and IBM charset."
url="https://gitlab.synchro.net/main/sbbs"
arch=(x86_64 i686)
license=(GPL-2.0-or-later)
depends=(ncurses)
makedepends=(git unzip sdl2 libx11)
optdepends=('hicolor-icon-theme: for GUI icon support'
            'sdl2: for SDL GUI support'
            'libx11: for X11 GUI support')
provides=(syncterm)
conflicts=(syncterm)
source=("syncterm::git+https://gitlab.synchro.net/main/sbbs.git#branch=syncterm-1.3")
sha256sums=('SKIP')

pkgver()  {
    cd syncterm
    git describe --long --tags --abbrev=7 | sed 's/^syncterm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "syncterm/src/syncterm"
	make PREFIX="/usr" MANPREFIX="/usr/share" RELEASE=1
}

package() {
	cd "syncterm/src/syncterm"
	make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share" RELEASE=1 install
}
