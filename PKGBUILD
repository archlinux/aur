# Maintainer: Skunnyk <skunnyk@archlinux.fr>
# Maintainer: Andre Miranda <andreldm at xfce dot org>
pkgname=xfce4-screenshooter-git
pkgver=1.10.5.r50.g2a7d7de
pkgrel=1
pkgdesc="Plugin that makes screenshots for the Xfce panel."
arch=('i686' 'x86_64')
url="https://docs.xfce.org/apps/screenshooter/start"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libsoup')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
provides=('xfce4-screenshooter')
conflicts=('xfce4-screenshooter')
install=$pkgname.install
source=($pkgname::git+https://gitlab.xfce.org/apps/xfce4-screenshooter.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -r 's/^xfce4-screenshooter-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare () {
	cd "$srcdir/$pkgname"

	git submodule update --init

	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--disable-debug
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
