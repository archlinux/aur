# Maintainer: Byron Torres <b@torresjrjr.com>
# Project: https://sr.ht/~sircmpwn/himitsu

pkgname=himitsu
_revision=113 # git rev-list --count master
_commit=003c147
pkgver="r$_revision.$_commit"
pkgrel=1
pkgdesc='Secret storage manager'
arch=(x86_64)
url='https://himitsustore.org/'
license=(GPL3)
depends=()
makedepends=(hare scdoc)
optdepends=('hiprompt-gtk-py: prompter support (GTK+)')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$_commit.tar.gz")
_extractedpath="$pkgname-$_commit"
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_extractedpath"
	make PREFIX=/usr
}

check() {
	cd "$srcdir/$_extractedpath"
	make PREFIX=/usr check
}

package() {
	cd "$srcdir/$_extractedpath"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	cd "$srcdir"
	install -Dm644 ../himitsud.service \
		"$pkgdir/usr/lib/systemd/user/himitsud.service"
}
