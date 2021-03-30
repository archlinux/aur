# Maintainer: SanskritFritz (gmail)

_pkgname=factropy
pkgname=$_pkgname-git
pkgver=1
pkgrel=1
pkgdesc='A hobby gamedev project heavily influenced by Factorio'
arch=('x86_64')
url='https://github.com/seanpringle/factropy'
license=('MIT')
depends=(libglvnd)
makedepends=(git)
source=("git+https://github.com/seanpringle/factropy.git" "git+https://github.com/seanpringle/raylib.git" "factropy.sh")
md5sums=('SKIP' 'SKIP' 'b77189e6385420fcc54dcbce0f77e25c')

prepare() {
	cd "$_pkgname"
	git submodule init
	git config submodule.raylib.url $srcdir/raylib
	git submodule update
}

build() {
	cd "$_pkgname"
	make linux
}

package() {
	cd "$_pkgname"
	mkdir -p "$pkgdir/usr/"{bin,share/factropy}
	cp --recursive "$srcdir/factropy/"{font,models,shaders,script,factropy} "$pkgdir/usr/share/factropy/"
	cp "$srcdir/factropy.sh" "$pkgdir/usr/bin/factropy"
	chmod +x "$pkgdir/usr/bin/factropy"
}
