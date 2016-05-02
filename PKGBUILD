pkgname=xfce4-smartbookmark-plugin-git
_pkgname=${pkgname%-git}
pkgver=0.4.6.r22.g6be4a75
pkgrel=1
pkgdesc='Plugin for the Xfce4 panel that lets you quicksearch from selected websites'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-smartbookmark-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-smartbookmark-plugin')
provides=('xfce4-smartbookmark-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
install=xfce4-smartbookmark-plugin.install
source=('git://git.xfce.org/panel-plugins/xfce4-smartbookmark-plugin')
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

