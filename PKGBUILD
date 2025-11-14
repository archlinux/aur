# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=intel-lpmd
pkgver=0.1.0
pkgrel=1
pkgdesc="Intel Low Power Mode Daemon"
arch=('x86_64')
url="https://github.com/intel/$pkgname"
license=('GPL-2.0-or-later')
makedepends=('git' 'automake' 'autoconf-archive' 'gtk-doc' 'glib2-devel' 'systemd')
depends=('libxml2-legacy' 'libnl' 'systemd-libs' 'polkit' 'upower')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('23f4c8588cc057c327c6b031c377b03193d62554f3b5a68284582f4e5a35c462')

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
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "$srcdir/${pkgname}"/README.md
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "$srcdir/${pkgname}"/doc/WLT_proxy.md
}
