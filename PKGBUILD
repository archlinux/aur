# Maintainer: aspen <luxx4x@protonmail.com>

pkgname="apple-sdk-macos"
pkgver=10.15
pkgrel=1
arch=('any')
pkgdesc="macOS SDKs"
url="https://github.com/phracker/MacOSX-SDKs"
license=('custom')
depends=()
install="sdk.install"
makedepends=('git' 'findutils')
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')
options=(!strip)

pkgver() {
	cd "$pkgname"
	printf "%s.r%s" "$(git show -s --format=%ci master | sed "s/\ .*//g;s/-//g")" "$(git rev-list --count HEAD)"
}

prepare() {
	cd "$pkgname"
	find . -type f -name ".DS_Store" -delete
}

package() {
	mkdir -p "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/$pkgname"

	find "$pkgdir/opt/$pkgname/" -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir/opt/$pkgname"
}
