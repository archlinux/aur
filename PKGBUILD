# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=uxn11-git
pkgver=r288.897e0a5
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
	gcc -Os -DNDEBUG -g0 -s \
		src/uxn.c \
		src/devices/*.c \
		src/uxn11.c -o uxn11 -lX11
}

package() {
	cd "$pkgname"
	install -Dm755 uxn11 -t "${pkgdir}/usr/bin"
}
