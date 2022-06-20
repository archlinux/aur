# Maintainer: Byron Torres <b@torresjrjr.com>
# Project: https://sr.ht/~sircmpwn/himitsu

pkgname=himitsu
pkgver='0.1'
pkgrel=1
pkgdesc='Secret storage manager'
arch=(x86_64)
url='https://himitsustore.org/'
license=(GPL3)
depends=()
makedepends=(hare scdoc)
optdepends=('hiprompt-gtk-py: prompter support (GTK+)')
_extracted="$pkgname-$pkgver"
source=("$_extracted.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6566de19d58289dfcdafc476054287fa55a9c4e74d64ba49a5ccbea3473b5a64')

build() {
	cd "$srcdir/$_extracted"
	make PREFIX=/usr
}

check() {
	cd "$srcdir/$_extracted"
	make PREFIX=/usr check
}

package() {
	cd "$srcdir/$_extracted"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	cd "$srcdir"
	install -Dm644 ../himitsud.service \
		"$pkgdir/usr/lib/systemd/user/himitsud.service"
}
