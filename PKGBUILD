# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=uxn11-git
pkgver=r653.a18193a
pkgrel=1
pkgdesc='An emulator for the Uxn virtual stack-machine, written in ANSI C.'
arch=('any')
url="https://100r.co/site/uxn.html"
license=('MIT')
makedepends=('git')
depends=('libx11')
source=("$pkgname::git+https://git.sr.ht/~rabbits/uxn11")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make bin/uxn11
}

package() {
	cd "$pkgname"
	install -Dm644 doc/man/*.7 -t "${pkgdir}/usr/share/man/man7"
	install -Dm755 bin/uxn11 -t "${pkgdir}/usr/bin"
}
