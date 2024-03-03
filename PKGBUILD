# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=intel-lpmd
pkgver=0.0.3
pkgrel=2
pkgdesc="Intel Low Power Mode Daemon"
arch=('x86_64')
url="https://github.com/intel/$pkgname"
license=('GPL-2.0-or-later')
makedepends=('git' 'automake' 'autoconf-archive' 'gtk-doc')
depends=('dbus-glib' 'libxml2' 'libnl' 'systemd-libs')
source=(git+${url}.git#tag=v${pkgver} 90-intel-lpmd.rules)
sha256sums=('SKIP'
            'f40f544c913ea3441477bb128b5fcd5a70aaa4c62690a2a0fb5b814ffad8d6a9'
)

prepare() {
	cd "$pkgname"
	./autogen.sh prefix=/usr sysconfdir=/etc sbindir=/usr/bin
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" make install
	install -Dm 644 -t "${pkgdir}/usr/lib/udev/rules.d" "$srcdir/90-intel-lpmd.rules"
}
