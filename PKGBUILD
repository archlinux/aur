# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: swanson <webaake gmail com>

_pkgname=mousepad
pkgname=${_pkgname}-git
pkgver=0.4.0.r160.g7ebcb77
pkgrel=1
pkgdesc="Simple text editor for Xfce  (git checkout)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL')
depends=('gtksourceview3' 'dbus-glib')
makedepends=('xfce4-dev-tools' 'git' 'intltool' 'perl')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git://git.xfce.org/apps/mousepad")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	
	git describe --long | sed "s/^${_pkgname}-//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cd "${srcdir}/${_pkgname}"

	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/xfce4 \
		--disable-static \
		--disable-debug
	
	make  
}

package() {
	cd "${srcdir}/${_pkgname}"
	
	make DESTDIR="$pkgdir" install
}


