# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

# You can install/update Subtitle Composer from repository if you add following to /etc/pacman.conf
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

pkgname=subtitlecomposer-git
pkgver=v0.5.8
pkgrel=1
pkgdesc="A KDE subtitle editor - nightly build"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/subtitlecomposer"
license=('GPL')
depends=('kdelibs' 'gettext')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('subtitlecomposer')
install='subtitlecomposer.install'
optdepends=(
	'mpv: for MPV backend'
	'mplayer: for MPlayer backend'
	'mplayer2: for MPlayer backend'
	'gstreamer: for GStreamer backend'
	'xine-lib: for Xine backend'
	)
source=('git+https://github.com/maxrd2/subtitlecomposer.git')
md5sums=('SKIP')

pkgver() {
	export APP_VER=${pkgver}
	cd ${srcdir}/subtitlecomposer
	git describe --always | sed 's|-|.|g'
}

build() {
	cd ${srcdir}/subtitlecomposer
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ${srcdir}/subtitlecomposer
	make DESTDIR=${pkgdir} install
}
