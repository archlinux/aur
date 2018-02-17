# Maintainer: mickybart <mickybart@pygoscelis.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-gb-platform
pkgver=r55.36fb493
pkgrel=1
pkgdesc="platform library for external kodi addons (retroplayer / garbear)"
arch=('armv7h' 'x86_64')
url='https://github.com/xbmc/kodi-platform'
license=('GPL')
provides=('kodi-platform')
conflicts=('kodi-platform' 'kodi-platform-git')
depends=('kodi-gb' 'p8-platform-gb')
makedepends=('git' 'cmake' 'kodi-gb-dev')

#https://github.com/garbear/xbmc/blob/retroplayer-18alpha1/cmake/addons/depends/common/kodi-platform/kodi-platform.txt
_commit=36fb49371dbce49bf470a5bb1fc51b74b4a3612d
source=("$pkgname::git://github.com/xbmc/kodi-platform.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	_revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	echo "$_revision"
}

build() {
	cd "$pkgname"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		-DUSE_LTO=1
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}


