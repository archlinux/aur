pkgname="i3lock-color"
pkgver=2.10.1
pkgrel=4
_version="2.10.1-1-c"
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/PandorasFox/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'pam' 'libev' 'cairo' 'libxkbcommon-x11')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock')
source=("https://github.com/PandorasFox/i3lock-color/archive/${_version}.tar.gz")
sha256sums=('df1b834c76461e5ff6c7799ffcb4e3d7dbcc8bc9f5ba5f62b4e74f1a7c63df66')

build() {
	cd "${srcdir}/${pkgname}-${_version}"

	# Fix ticket FS#31544, sed line taken from gentoo
	sed -i -e 's:login:system-auth:' pam/i3lock 
	
	autoreconf -fi
	./configure --prefix="$pkgdir/usr/" --sysconfdir="$pkgdir/etc/"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${_version}"
	make install
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
