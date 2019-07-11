# Maintainer: James Milne <s4b3r6@gmail.com>
pkgname=evjl
pkgver=v0.3.1
pkgrel=3
epoch=
pkgdesc="A low-level programming language, currently in 'alpha' levels of design."
arch=(x86_64)
url="https://git.sr.ht/~shakna/evjl"
license=('custom:3-clause BSD')
groups=('devel')
depends=('tcc')
makedepends=('xxd')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://git.sr.ht/~shakna/evjl")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git checkout "$pkgver"
	git submodule update --init --recursive
	git submodule foreach git pull origin master
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
