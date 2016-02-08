# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

# You can install/update Subtitle Composer from repository if you add following to /etc/pacman.conf
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

# If dependencies 'mpv' and 'xine-lib' are not installed 
# they can be removed from depends line, and 
# package will built without mpv/xine support

pkgname=subtitlecomposer-git
pkgver=0.5.8.3.gd340bf2
pkgrel=1
pkgdesc="A KDE subtitle editor - nightly build"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/subtitlecomposer"
license=('GPL')
depends=('kdebase-runtime' 'kross' 'mpv' 'xine-lib')
makedepends=('cmake' 'automoc4' 'git' 'gettext')
conflicts=('subtitlecomposer')
install='subtitlecomposer.install'
optdepends=(
	'mplayer: for MPlayer backend'
	'mplayer2: for MPlayer backend'
	'ruby: for scripting'
	'python: for scripting'
	)
source=('git+https://github.com/maxrd2/subtitlecomposer.git')
md5sums=('SKIP')

pkgver() {
	export APP_VER=${pkgver}
	cd ${srcdir}/subtitlecomposer
	git describe --always | sed 's|-|.|g' | sed -e 's/^v//g'
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
