# Maintainer: cylgom <cylgom@gmail.com>
pkgname=ly-git
pkgver=0.2
pkgrel=1
pkgdesc="ncurses display manager"
arch=('i686' 'x86_64')
url="https://github.com/cylgom/ly"
license=('custom:WTFPL')
makedepends=('git')
depends=('pam' 'xorg-xinit' 'xorg-xauth')
source=('git+https://github.com/cylgom/ly.git'
	'git+https://github.com/cylgom/termbox-next.git'
	'git+https://github.com/benhoyt/inih.git')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd ly
	git describe --tags
}

prepare() {
	cd ly
	git submodule update --init --recursive
}

build() {
	cd ly
	make
}

package() {
	cd ly
	make DESTDIR="$pkgdir" install
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
