
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=chayang-git
_pkgname=chayang
pkgver=r3.70c3b7c
pkgrel=1
pkgdesc='Gradually dim the screen.'
arch=('x86_64')
url='https://git.sr.ht/~emersion/chayang'
license=('MIT')
provides=('chayang')
conflicts=('chayang')
depends=('git' 'wayland')
makedepends=('meson' 'ninja' 'wayland-protocols')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	arch-meson . build
	meson compile -C build
}

package() {
	cd "$srcdir/$_pkgname"
	meson install -C build --destdir "$pkgdir"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
