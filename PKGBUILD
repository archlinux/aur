# Maintainer: Finn Arendt <finn-arendt-aur at ubermail dot me>
pkgname=witfocus
pkgver=0.9.8
pkgrel=1
pkgdesc="CLI tool for simple task management"
arch=(any)
url="https://github.com/arendtio/witfocus"
license=('MIT')
# unneeded depends=('coreutils' 'gawk' 'vim')
depends=('bash')
makedepends=('autoconf' 'automake')
source=("git+https://github.com/arendtio/witfocus.git#tag=$pkgver")
sha512sums=(SKIP)
backup=("etc/$pkgname.conf")

build() {
	cd "$pkgname"
	autoreconf --install
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
