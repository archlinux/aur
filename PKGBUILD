# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=rpcapd-git
pkgver=r12.924fc55
pkgrel=1
pkgdesc="Remote Packet Capture Daemon"
arch=(x86_64)
url=""
license=('BSD')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('rpcapd::git+https://github.com/frgtn/rpcapd-linux.git' 'rpcapd.service')
noextract=()
md5sums=('SKIP'
         '9327c94b8a0557f2204a51d5f2863b24')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	#patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}/libpcap"
	./configure
	make
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	install -d "$pkgdir/usr/lib/systemd/system"
	install "$srcdir/rpcapd.service" "$pkgdir/usr/lib/systemd/system/rpcapd.service"
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/bin"
	install rpcapd "$pkgdir/usr/bin/rpcapd"
}
