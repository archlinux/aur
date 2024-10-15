# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=intel-lpmd
pkgver=0.0.8
pkgrel=1
pkgdesc="Intel Low Power Mode Daemon"
arch=('x86_64')
url="https://github.com/intel/$pkgname"
license=('GPL-2.0-or-later')
makedepends=('git' 'automake' 'autoconf-archive' 'gtk-doc' 'glib2-devel' 'systemd')
depends=('libxml2' 'libnl' 'systemd-libs' 'polkit' 'upower')
source=(git+${url}.git#tag=v${pkgver} 90-intel-lpmd.rules)
sha256sums=('b59f99eed5a6f712c8748ff155ab2b1da5ec3c8f0261a0b307c1f9de394be26e'
            'f40f544c913ea3441477bb128b5fcd5a70aaa4c62690a2a0fb5b814ffad8d6a9')

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
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "$srcdir/${pkgname}"/README.md
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "$srcdir/${pkgname}"/doc/WLT_proxy.md
}
