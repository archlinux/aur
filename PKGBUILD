# Maintainer: Skunnyk <skunnyk@archlinux.fr>
# Maintainer: Andre Miranda <andreldm at xfce dot org>
pkgname=xfce4-screenshooter-git
pkgver=1.9.10.r38.g13d0c95
pkgrel=1
pkgdesc="Plugin that makes screenshots for the Xfce panel."
arch=('i686' 'x86_64')
url="https://docs.xfce.org/apps/screenshooter/start"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libsoup')
makedepends=('xfce4-dev-tools' 'intltool')
provides=('xfce4-screenshooter')
conflicts=('xfce4-screenshooter')
install=$pkgname.install
source=($pkgname::git+https://gitlab.xfce.org/apps/xfce4-screenshooter)
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -r 's/^xfce4-screenshooter-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--disable-debug
	make
}
package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et: 
