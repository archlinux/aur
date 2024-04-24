# Maintainer: Bartłomiej Szostak <kapcioszek2137@gmail.com>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Iru Cai <https://vimacs.wehack.space>
# Contributor: Pierpaolo Valerio

pkgname=(dpic dpic-docs)
pkgver=2024.01.01
pkgrel=1
pkgdesc="A pic language interpreter."
arch=('x86_64')
url="https://ece.uwaterloo.ca/~aplevich/dpic"
license=('BSD')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz")
sha256sums=('161901ac9af86d7305512ba1b5649404fb4c803a0fab062627cc3c5895ad872f')

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
