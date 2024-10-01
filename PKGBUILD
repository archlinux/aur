# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>
pkgname=pokego-git
pkgrel=1
pkgver=r9.13b23757
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal."
arch=('any')
url="https://github.com/rubiin/pokego.git"
license=("GPL-3.0")
depends=('coreutils' 'go' 'upx')
makedepends=('git')
conflicts=('pokego')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "${pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	go build -o pokego
	upx pokego
}

package() {
	cd "$pkgname"
	install -Dm755 pokego "$pkgdir/usr/bin/pokego"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
