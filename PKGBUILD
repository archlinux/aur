# Maintainer: Igor <f2404@yandex.ru>
_pkgname=xfce4-terminal
pkgname=xfce4-terminal-git
pkgver=0.8.4.r1.g692495c
pkgrel=1
pkgdesc="A modern terminal emulator primarily for the Xfce desktop environment - git checkout"
arch=('i686' 'x86_64')
url="http://docs.xfce.org/apps/terminal/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'vte3>=0.38' 'hicolor-icon-theme')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
provides=('xfce4-terminal')
conflicts=('xfce4-terminal' 'terminal')
replaces=('xfce4-terminal' 'terminal')
source=(git://git.xfce.org/apps/$_pkgname)
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/xfce4 \
		--localstatedir=/var \
		--disable-static \
		--disable-debug
	make
}
package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}
