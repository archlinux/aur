# Maintainer: Laura Demkowicz-Duffy

pkgname=pascal-fc
pkgver=1
pkgrel=6
pkgdesc="An implementation of pascal with extra constructs for teaching concurrent programming"
arch=('x86_64')
url="https://github.com/lexbailey/Pascal-FC"
license=('GPL-2.0-or-later')
depends=(bash)
makedepends=('git' 'fpc')
source=("pascal-fc-$pkgver::git+$url#commit=b1bd078511879f8b678c8f7395d727953415926f"
	'install_script.patch')
md5sums=('f122e04b509c26896cb2493af815f8c8'
         'd77ebe2d4cad9d3446796dc9047450e9')

prepare() {
	cd "$pkgname-$pkgver"
	patch --forward --strip=1 --input="$srcdir/install_script.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make pfccomp
	make pint
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr/bin" install
}
