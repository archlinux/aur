# Maintainer: Marcel Röthke <marcel@roethke.info>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.6.0
pkgrel=1
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64" "armv7h")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL")
depends=("gmime3" "xapian-core")
makedepends=("emacs" "guile")
optdepends=("guile: guile support"
	"emacs: mu4e support")
source=("mu-$pkgver.tar.gz::https://github.com/djcb/mu/archive/$pkgver.tar.gz")
md5sums=('c3e96ad2be8084a2ac9f1cb24379e7a3')

prepare() {
	cd "$pkgname-$pkgver"
	autoreconf -i
}


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --disable-webkit --disable-gtk --enable-mu4e --enable-guile
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
