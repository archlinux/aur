# Maintainer: spelufo <santiagopelufo@gmail.com>
pkgname=scsh-git
pkgver=20150110
pkgrel=1
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
source=("git+https://github.com/scheme/scsh" "Makefile.in.patch")
md5sums=('SKIP'
         '2ef9f652e51741fa35dd9b5aa75c5f12')
validpgpkeys=()


pkgver() {
	cd ${pkgname%-git}
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
	cd ${pkgname%-git}
	git submodule update --init
	patch -Nup0 < $srcdir/Makefile.in.patch
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
