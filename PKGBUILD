# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=intel-lpmd
pkgver=0.0.9
pkgrel=1
pkgdesc="Intel Low Power Mode Daemon"
arch=('x86_64')
url="https://github.com/intel/$pkgname"
license=('GPL-2.0-or-later')
makedepends=('git' 'automake' 'autoconf-archive' 'gtk-doc' 'glib2-devel' 'systemd')
depends=('libxml2' 'libnl' 'systemd-libs' 'polkit' 'upower')
source=(git+${url}.git#tag=v${pkgver} 90-intel-lpmd.rules)
sha256sums=('86a3d3f64fc40b5d56e28a54200da0deec3a6e1dedc16f1c0e515d802fff7b6b'
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
