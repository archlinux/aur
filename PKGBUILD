# Maintainer: YuutaW <i@yuuta.moe>
pkgname=tcptunnel-git
pkgver=v0.8
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="https://github.com/vakuum/tcptunnel"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=('etc/tcptunnel/tcptunnel.conf')
options=()
install=
source=("$pkgname::git+https://github.com/vakuum/tcptunnel.git"
    "tcptunnel.service"
    "tcptunnel.conf")
noextract=()
md5sums=('SKIP'
         '9f7f07e2d2c9ee580a469838661bb370'
         '96479f7d6fb3beeec44c9c64342d6626')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix="/usr"
	make
}

package() {
	cd "$srcdir/$pkgname"
    make BINDIR="$pkgdir/usr/bin" install

    mkdir -p $pkgdir/usr/lib/systemd/system
	install -Dm644 $srcdir/tcptunnel.service $pkgdir/usr/lib/systemd/system/tcptunnel.service

    mkdir -p $pkgdir/etc/tcptunnel
	install -Dm644 $srcdir/tcptunnel.conf $pkgdir/etc/tcptunnel/tcptunnel.conf
}
