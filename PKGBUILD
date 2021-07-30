# Maintainer: Raymond Li <aur@raymond.li>
# Co-maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=i3lock-color
pkgver=2.13.c.4
pkgrel=1
pkgdesc="The world's most popular non-default computer lockscreen."
arch=('i686' 'x86_64')
url="https://github.com/Raymo111/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'pam' 'libev' 'cairo' 'libxkbcommon-x11'
         'libjpeg-turbo' 'xcb-util-xrm' 'pkgconf')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock' 'i3lock-color-git')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('5df4cd3d515d938630ced981a7f0a6e01344d1ec51d10fd3c3d131d19283df69')

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
