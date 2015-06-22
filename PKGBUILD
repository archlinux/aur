# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=xfce4-screenshooter-git
pkgver=1.8.1.r152.gfb51e30
pkgrel=3
pkgdesc="Plugin that makes screenshots for the Xfce panel."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libsoup' 'hicolor-icon-theme')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
provides=('xfce4-screenshooter')
conflicts=('xfce4-screenshooter')
install=$pkgname.install
source=($pkgname::git://git.xfce.org/apps/xfce4-screenshooter)
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
