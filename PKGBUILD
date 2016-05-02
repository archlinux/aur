pkgname=xfce4-systemload-plugin-git
_pkgname=${pkgname%-git}
pkgver=1.1.2.r66.gf0d2499
pkgrel=1
pkgdesc='A system load plugin for the Xfce4 panel'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-systemload-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel' 'upower')
conflicts=('xfce4-systemload-plugin')
provides=('xfce4-systemload-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
install=xfce4-systemload-plugin.install
source=('git://git.xfce.org/panel-plugins/xfce4-systemload-plugin')
sha256sums=('SKIP')

pkgver() {
	  cd "$_pkgname"
	    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

