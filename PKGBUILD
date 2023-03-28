# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Iru Cai <https://vimacs.wehack.space>
# Contributor: Pierpaolo Valerio

pkgname=(dpic dpic-docs)
pkgver=2023.02.01
pkgrel=2
pkgdesc="A pic language interpreter."
arch=('x86_64')
url="https://ece.uwaterloo.ca/~aplevich/dpic"
license=('BSD')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz")
sha256sums=('d059ff28c04552066c164fb146fee8e0101b953e46e75919b3dcfaa99b031ae6')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package_dpic() {
	depends=('glibc')
	optdepends=('dpic-docs: Documentation for using dpic')
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" installdpic
	install -Dvm644 Copyright.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_dpic-docs() {
	arch=('any')
	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/usr" installdocs
	install -Dvm644 Copyright.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
