# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
pkgver=0.6.1
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
sha256sums=('9cf9ae307a780afe5b808b8233ac85ecf948f846efbcfb60a6adcc8fd77017aa')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"

	meson --buildtype plain build \
		--prefix=/usr \
		--bindir=/usr/bin \
		--libexecdir=/usr/lib/${pkgname}

	ninja -C build -j$(($(getconf _NPROCESSORS_ONLN)+1))
}


package() {
	cd "${srcdir}/${pkgname}-v${pkgver}/build"

	DESTDIR="${pkgdir}" ninja install
}

