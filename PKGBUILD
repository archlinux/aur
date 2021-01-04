# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-git
pkgver=r27.51071dc
pkgrel=1
pkgdesc="Changes pacman syntax to be more like APT"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPLv3')
depends=('yay')
provides=('pak')
conflicts=('pak')
makedepends=('go')
source=('git+https://gitea.arsenm.dev/Arsen6331/pak.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/pak"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/pak"
	make
}

package() {
	cd "$srcdir/pak"
	make PAK_CFG_MGR="yay" DESTDIR="$pkgdir" install
}
