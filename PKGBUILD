# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=xfwm4-tiling
_realname=xfwm4
pkgver=4.10.1
pkgrel=2
pkgdesc="Xfce window manager with corner tiling patch"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=("libxfce4ui" "libwnck" "hicolor-icon-theme")
makedepends=('intltool')
provides=("${_realname}=${pkgver}")
conflicts=("${_realname}")
replaces=("${_realname}")
options=('!libtool')
install=${pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_realname}/4.10/${_realname}-${pkgver}.tar.bz2
		${pkgname}-${pkgver}-${pkgrel}.patch)
sha256sums=('380c44fba6eb779e34be0fe94f3726cfa131803014d6073c45aec8a1257fa740'
			'585a14790072ae6f7bffa8c65069c91fd03f10fbffbcd4cc73096a794608ffd6')

prepare() {
	cd "${srcdir}/${_realname}-${pkgver}"

	# Corner tiling patch
	patch -p1 < ${srcdir}/${pkgname}-${pkgver}-${pkgrel}.patch
}

build() {
	cd "${srcdir}/${_realname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-startup-notification \
		--enable-randr \
		--enable-compositor \
		--enable-xsync \
		--disable-debug

	make
}

package() {
	cd "${srcdir}/${_realname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}
