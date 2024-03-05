# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=wl-gears-git
pkgver=r7.b7ecdeb
pkgrel=1
pkgdesc="Gears for Wayland compositors"
arch=(x86_64)
url="https://git.sr.ht/~soreau/${pkgname%-git}"
license=(MIT)
depends=(libepoxy libglvnd wayland)
makedepends=(git wayland-protocols)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::git+$url)
b2sums=('SKIP')

pkgver() {
	cd $srcdir/${pkgname%-git}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/${pkgname%-git}
	sed -n 's/ \* //g;2,20p' gears.c > LICENSE
}

build() {
	cd $srcdir/${pkgname%-git}
	make
}

package() {
	cd $srcdir/${pkgname%-git}
	install -Dm755 ${pkgname%-git} -t $pkgdir/usr/bin/
	install -Dm644 LICENSE         -t $pkgdir/usr/share/licenses/${pkgname%-git}/
}
