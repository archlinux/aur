# Maintainer: mickybart <mickybart@pygoscelis.org>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=p8-platform-gb
pkgver=r100.3219004
pkgrel=1
pkgdesc="Platform support library used by libCEC and binary add-ons for Kodi (retroplayer / garbear)"
arch=('armv7h' 'x86_64')
url='https://github.com/Pulse-Eight/platform'
license=('GPL')
provides=('p8-platform')
conflicts=('libplatform' 'p8-platform')
replaces=('libplatform')
makedepends=('cmake')
depends=('gcc-libs')

#https://github.com/garbear/xbmc/blob/retroplayer-18alpha1/cmake/addons/depends/common/p8-platform/p8-platform.txt
_commit=32190045c7eb6883c0662db2f91b4ceeab904fc2
source=("$pkgname::git://github.com/xbmc/platform.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	_revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	echo "$_revision"
}

build() {
	cd "$pkgname"
	cmake . \
		-DCMAKE_BUILD_TYPE=Release \
    		-DBUILD_SHARED_LIBS=1 \
    		-DCMAKE_INSTALL_PREFIX=/usr \
    		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
    		-DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}


