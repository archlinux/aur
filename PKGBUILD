pkgname=xfce4-diskperf-plugin-git
_pkgname=${pkgname%-git}
pkgver=2.5.5.r23.gfe6abce
pkgrel=1
pkgdesc='Plugin for the Xfce4 panel displaying instant disk/partition performance'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-diskperf-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-diskperf-plugin')
provides=('xfce4-diskperf-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
install=xfce4-diskperf-plugin.install
source=('git://git.xfce.org/panel-plugins/xfce4-diskperf-plugin')
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

