# Maintainer: Raymond Li <aur@raymond.li>
# Co-maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=i3lock-color
pkgver=2.13.c.3
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
sha256sums=('3932ec280aa9baa1cd1c7703d704cc4657efd4a6af392967bbb38d9bf9fbcc68')

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
