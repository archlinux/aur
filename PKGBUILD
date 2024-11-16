# Maintainer: shadeLight <arch spiralchar guilhaume dot fr>
# Contributor: Skunnyk <skunnyk at archlinux dot fr>

pkgname=xfce4-netload-plugin-git
_pkgname=${pkgname%-git}
pkgver=1.4.1.r123.g4302b86
pkgrel=1
pkgdesc='A netload plugin for the Xfce panel'
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-netload-plugin')
provides=('xfce4-netload-plugin')
makedepends=('xfce4-dev-tools' 'git')
options=('!libtool')
source=('git://git.xfce.org/panel-plugins/xfce4-netload-plugin')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 | sed 's/^xfce4-netload-plugin-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"/

	./autogen.sh --prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-maintainer-mode \
		--disable-debug
	make
}

package() {
	cd "$_pkgname"

	make DESTDIR="${pkgdir}" install
}

