# Maintainer: Cookie Engineer <@cookiengineer>

pkgname=hydroxide-git
pkgver=r143.ba96d88
pkgrel=1
pkgdesc="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
makedepends=('git' 'go')
url="https://github.com/emersion/hydroxide"
license=('MIT')
source=('git+https://github.com/emersion/hydroxide')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/hydroxide"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/hydroxide";
	go build "./cmd/hydroxide";
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/hydroxide/hydroxide" "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/hydroxide/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

