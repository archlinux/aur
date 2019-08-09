# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
pkgver=0.6.0
pkgrel=1
epoch=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment.'
arch=('i686' 'x86_64')
url='https://github.com/getsolus/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel' 'libnotify')
makedepends=('gnome-common' 'gettext' 'itstool' 'vala>=0.36' 'meson' 'ninja' )
source=("https://github.com/getsolus/${pkgname}/archive/v$pkgver.tar.gz")
sha256sums=('b04ae280f1b77663f05572e47bc8591f28511d9d8976b6ee399e8183e258aa98')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build

	meson build \
		--prefix=/usr \
		--bindir=/usr/bin \
		--libexecdir=/usr/lib/${pkgname}

	ninja -C build
}


package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	DESTDIR="${pkgdir}" ninja install
}

