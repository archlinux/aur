# Maintainer: spelufo <santiagopelufo@gmail.com>
pkgname=scsh-git
pkgver=20151026
pkgrel=2
pkgdesc="Scheme Shell"
arch=('i686' 'x86_64')
url="http://github.com/scheme/scsh"
license=('unknown')
groups=()
depends=('scheme48')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/scheme/scsh")
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd ${pkgname%-git}
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
	cd ${pkgname%-git}
	git submodule update --init
}

build() {
	cd ${pkgname%-git}
	autoreconf
	./configure --prefix=/usr --with-scheme48=/usr
	make
}

package() {
	cd ${pkgname%-git}
	make DESTDIR="$pkgdir/" install 
}
