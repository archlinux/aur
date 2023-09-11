# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=qalcmenu
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
epoch=
pkgdesc='A qalc frontend for menus like rofi, bemenu, and dmenu.'
arch=(any)
url="https://github.com/MithicSpirit/$_pkgname"
license=('AGPL3')
depends=(libqalculate bash util-linux coreutils wl-clipboard)
makedepends=(git)
optdepends=('rofi: rofi frontend'
            'bemenu: bemenu frontend'
            'dmenu: dmenu frontend')
provides=(menu-qalc menu-calc)
conflicts=(menu-qalc menu-calc)
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" ./qalcmenu ./=
	install -Dm644 -t "$pkgdir/usr/share/man/man1" ./qalcmenu.1 ./=.1
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
