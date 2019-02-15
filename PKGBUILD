# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
pkgver=0.5.0
pkgrel=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment.'
arch=('i686' 'x86_64')
url='https://github.com/solus-project/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel' 'libnotify')
makedepends=('gnome-common' 'gettext' 'itstool' 'vala>=0.36' 'meson' 'ninja' )
source=("https://github.com/solus-project/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
md5sums=('7230dba13a9ddb15cc5d6d7e16ac6e16')


build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	mkdir build

	meson build \
		--prefix=/usr \
		--bindir=/usr/bin \
		--libexecdir=/usr/lib/${pkgname}

	ninja -C build
}


package() {
	cd "${srcdir}/${pkgname}-v${pkgver}/build"

	DESTDIR="${pkgdir}" ninja install
}
