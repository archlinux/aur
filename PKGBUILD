#Maintainer: Bartkk <thebartkk@gmail.com>
pkgname=ceserver-git
pkgver=r5666.afeb8029
pkgrel=1
pkgdesc='Cheat Engine Server.'
arch=(x86_64)
url='https://github.com/cheat-engine/cheat-engine/tree/master/Cheat%20Engine/ceserver'
license=('custom')
depends=('zlib')
makedepends=('git' 'gcc') 
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/cheat-engine/cheat-engine.git")
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/Cheat Engine/ceserver/gcc"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm 755 "Cheat Engine/ceserver/gcc/ceserver" "$pkgdir/usr/bin/ceserver"
}
