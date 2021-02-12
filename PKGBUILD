# Maintainer: Aleksander Mietinen <aleksander at mietinen dot net>

pkgname=seclists
pkgver=2021.1
pkgrel=1
pkgdesc="A collection of multiple types of lists used during security assessments, collected in one place."
arch=('any')
url="https://github.com/danielmiessler/SecLists"
license=('MIT')
makedepends=('findutils' 'coreutils' 'tar')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ac44e33bc388f954e077db90714a2eab5d2c65e67400dda8b998ca555f9eb74f')

prepare() {
	cd "$srcdir/SecLists-$pkgver"
	find . -iname "rockyou*.tar.gz" -exec sh -c 'tar zxf {} -C $(dirname {}); rm {}' \;
}

package() {
	cd "$srcdir/SecLists-$pkgver"
	find . \( ! -iname "*.md" -a ! -iname ".git*" -a ! -name "LICENSE"  \) -type f -print0 | \
		xargs -I{} -0 install -Dm644 {} "$pkgdir/usr/share/$pkgname/{}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
