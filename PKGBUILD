# Maintainer: Igor <f2404@yandex.ru>
_pkgname=xfce4-terminal
pkgname=${_pkgname}-git
pkgver=0.9.0.r53.g3e0e4534
pkgrel=1
pkgdesc="A modern terminal emulator primarily for the Xfce desktop environment - git checkout"
arch=('i686' 'x86_64')
url="https://docs.xfce.org/apps/terminal/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'vte3>=0.38' 'hicolor-icon-theme')
makedepends=('intltool' 'git' 'xfce4-dev-tools' 'libxslt')
provides=('xfce4-terminal')
conflicts=('xfce4-terminal' 'terminal')
replaces=('xfce4-terminal' 'terminal')
source=("${_pkgname}::git+https://gitlab.xfce.org/apps/${_pkgname}.git")
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
