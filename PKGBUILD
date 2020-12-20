# Maintainer: Raymond Li <aur@raymond.li>
# Co-maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=i3lock-color
pkgver=2.13.c.1
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/Raymo111/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'pam' 'libev' 'cairo' 'libxkbcommon-x11'
         'libjpeg-turbo' 'xcb-util-xrm' 'pkgconf')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock' 'i3lock-color-git')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('691de5b10cb30bc3858390f5c8d22e5a0d1037b5d4b73948c8cf1955a71e5381')

build() {
	cd "$pkgname-$pkgver"
	
	autoreconf -fi
	./configure --prefix="$pkgdir/usr/" \
        --sysconfdir="$pkgdir/etc/" \
        --enable-debug=no \
        --disable-sanitizers
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
