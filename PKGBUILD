# Maintainer: Yuriusu <yuriusu@tuta.io>

pkgname="ttf-mdi"
pkgver=r1.34bdb81
pkgrel=1
pkgdesc="Material Design Icons Webfont"
arch=("any")
url="https://materialdesignicons.com"
license=("Apache")
makedepends=("git")
options=("!strip")

prepare() {
	git clone --filter=blob:none --depth=1 --no-checkout https://github.com/Templarian/MaterialDesign-Webfont $pkgname
	cd $pkgname
	git config core.sparseCheckout true
	echo LICENSE >> .git/info/sparse-checkout
	echo fonts/materialdesignicons-webfont.ttf >> .git/info/sparse-checkout
	git checkout master
}

pkgver() {
	cd $pkgname
	printf 'r%s.%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
	cd $pkgname
	install -D -m 0644 -t "$pkgdir/usr/share/fonts/${pkgname#*-}" fonts/materialdesignicons-webfont.ttf
	install -D -m 0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
