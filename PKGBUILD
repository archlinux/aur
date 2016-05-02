pkgname=xfce4-fsguard-plugin-git
_pkgname=${pkgname%-git}
pkgver=1.0.2.r23.g3c42868
pkgrel=1
pkgdesc='File system usage monitor plugin for the Xfce4 panel'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-fsguard-plugin')
provides=('xfce4-fsguard-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
install=xfce4-fsguard-plugin.install
source=('git://git.xfce.org/panel-plugins/xfce4-fsguard-plugin')
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

