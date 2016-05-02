pkgname=xfce4-datetime-plugin-git
_pkgname=${pkgname%-git}
pkgver=datetime.0.6.2.r80.gd8a4ed9
pkgrel=1
pkgdesc='A date and time display plugin for the Xfce panel'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-datetime-plugin')
provides=('xfce4-datetime-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
install=xfce4-datetime-plugin.install
source=('git://git.xfce.org/panel-plugins/xfce4-datetime-plugin')
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

