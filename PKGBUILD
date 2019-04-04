# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
# git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
_commit=3d5e63975d7c56cf2c63a0708065a694d6e54456
pkgver=0.6.0.r31.g3d5e639
pkgrel=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment.'
arch=('i686' 'x86_64')
url='https://github.com/getsolus/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel' 'libnotify')
makedepends=('gnome-common' 'gettext' 'itstool' 'vala>=0.36' 'meson' 'ninja' )
source=("https://github.com/getsolus/${pkgname}/archive/${_commit}.zip")
md5sums=('39ba48d21bd06fcd4f56bae9ac812cc0')


build() {
	cd "${srcdir}/${pkgname}-${_commit}"
	mkdir build

	meson build \
		--prefix=/usr \
		--bindir=/usr/bin \
		--libexecdir=/usr/lib/${pkgname}

	ninja -C build
}


package() {
	cd "${srcdir}/${pkgname}-${_commit}/build"

	DESTDIR="${pkgdir}" ninja install
}
