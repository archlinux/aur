pkgname="i3lock-color"
pkgver=2.10.1
pkgrel=2
_version="2.10.1c"
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/PandorasFox/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'pam' 'libev' 'cairo' 'libxkbcommon-x11')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock')
source=("https://github.com/PandorasFox/i3lock-color/archive/${_version}.tar.gz")
sha256sums=('a38078d63d6fd9d3b208e7c032bc11bc79a44d87006555c1c4399a4c6adb3d85')

build() {
	cd "${srcdir}/${pkgname}-${_version}"
	autoreconf -fi
	./configure --prefix="$pkgdir/usr/" --sysconfdir="$pkgdir/etc/"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${_version}"
	make install
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
