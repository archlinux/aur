# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
pkgver=0.6.2
pkgrel=1
epoch=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment.'
arch=('i686' 'x86_64')
url='https://github.com/getsolus/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel' 'libnotify')
makedepends=('gnome-common' 'gettext' 'itstool' 'vala>=0.36' 'meson' 'ninja' )
source=("https://github.com/getsolus/brisk-menu/releases/download/v${pkgver}/brisk-menu-v$pkgver.tar.xz")
sha256sums=('5a87f4dcf7365e81a571128bf0b8199eb06a6fcd7e15ec7739be0ccff1326488')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	meson --buildtype plain build \
		--prefix=/usr \
		--bindir=/usr/bin \
		--libexecdir=/usr/lib/${pkgname}

	ninja -C build -j$(($(getconf _NPROCESSORS_ONLN)+1))
}


package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	DESTDIR="${pkgdir}" ninja install
}

