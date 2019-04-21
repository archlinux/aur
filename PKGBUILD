# Maintainer: Paul Knopf <pauldotknopf@gmail.com>
pkgname=darch
pkgver=0.28.0
pkgrel=1
epoch=
pkgdesc="A utility to that uses containerd to build stateless operating system images that can be booted bare-metal."
arch=('x86_64')
url="https://github.com/godarch/darch"
license=('MIT')
groups=()
depends=('containerd')
makedepends=('go')
checkdepends=()
optdepends=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/godarch/darch/archive/v$pkgver.tar.gz")
md5sums=('aaee7bfe4df3be93a6c13c43eeeced52')
noextract=()
validpgpkeys=()
build() {
	export GOPATH="$srcdir/.gopath"
	mkdir -p "$GOPATH/src/github.com/godarch"
	ln -s "$srcdir/$pkgname-$pkgver" "$GOPATH/src/github.com/godarch/darch"
	cd "$GOPATH/src/github.com/godarch/darch" && make
}
package() {
	# The tarball has all the directories setup correctly.
	cd "$GOPATH/src/github.com/godarch/darch" && make install DESTDIR=$pkgdir
}
