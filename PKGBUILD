# Maintainer: Elara Musayelyan <moussaelianarsen@gmail.com>
pkgname=itd-git
pkgver=r14.81fe634
pkgrel=2
pkgdesc="Daemon that interfaces with InfiniTime firmware on the PineTime smartwatch"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPLv3')
depends=('bluez' 'dbus' 'playerctl')
provides=('itd' 'itctl')
conflicts=('itd' 'itctl')
makedepends=('go')
source=('git+https://gitea.elara.ws/Elara6331/itd.git')
md5sums=('SKIP')
backup=('etc/itd.toml')

pkgver() {
    cd "$srcdir/itd"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/itd"
	make
}

package() {
	cd "$srcdir/itd"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
