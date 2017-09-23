# Contributor: Dan Printzell <xwildn00bx@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dinu-git
pkgver=r49.0474dbc
pkgrel=1
pkgdesc="Launcher, file manager, one-way terminal"
arch=('i686' 'x86_64')
url="https://github.com/weltensturm/dinu"
license=('MIT')
groups=('dlang')
makedepends=('dmd' 'git' 'dub')
depends=('libphobos')
provides=('dinu')
conflicts=('dinu')
options=('!strip')
source=("git+https://github.com/weltensturm/dinu")
sha256sums=('SKIP')

pkgver() {
	cd dinu
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd dinu
	dub upgrade
}

build() {
	cd dinu
	dub build
	strip ./bin/dinu
}

package() {
	cd dinu
	# binaries
	install -d $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./bin/dinu
	install -m755 -t $pkgdir/usr/bin ./bin/complete.sh
}
