# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: swanson <webaake gmail com>

_pkgname=mousepad
pkgname=${_pkgname}-git
pkgver=0.4.2+143+g04bffec
pkgrel=1
pkgdesc="Simple text editor for Xfce  (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="http://www.xfce.org/"
license=('GPL')
depends=('gtksourceview3' 'dbus-glib')
makedepends=('xfce4-dev-tools' 'git' 'intltool' 'perl')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/apps/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	
	git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
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


