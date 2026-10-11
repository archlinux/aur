# Maintainer: Ateles
_pkgname=energygraph
pkgbase=energygraph-git
pkgname=$_pkgname-git
pkgver=r27.gc544eda
pkgrel=2
pkgdesc="Graphs the power use of a host inside a text terminal, using intel-rapl data from the /sys filesystem."
arch=('x86_64')
url="https://github.com/stolk/$_pkgname"
license=('MIT')
makedepends=('git' 'make')
source=(git+https://github.com/stolk/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf 'r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
