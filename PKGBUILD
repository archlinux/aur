# Maintainer: Martin Radulov <martin.yr@pm.me>
pkgname=hptools-git
pkgver=r4.dfa489f
pkgrel=1
pkgdesc="Tools from HP for assembling Saturn Assembly Language and compiling SysRPL."
arch=('x86_64')
url="https://github.com/martinyrm/hptools"
license=('GPL')
makedepends=('git') 
provides=("hptools")
conflicts=("hptools")
source=("$pkgname::git+https://github.com/martinyrm/hptools#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	make
}

build() {
	cd "$srcdir/${pkgname}/$CARCH-unknown-linux-gnu"
	make
}


package() {
	cd "$srcdir/${pkgname}/$CARCH-unknown-linux-gnu"
 	install -Dm 755 -t "$pkgdir/usr/bin/" sasm rplcomp sload makerom


}
