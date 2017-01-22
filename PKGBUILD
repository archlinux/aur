# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kochmorse-git
_pkgname=kochmorse
_author=hmatuschek
pkgver=3.2.2.r6.g5ceff39
pkgrel=1
pkgdesc="A simple (Ham Radio) morse tutor using the Koch method - GIT version."
arch=('i686' 'x86_64')
url="https://github.com/$_author/$_pkgname"
license=('GPL')
depends=('qt5-svg' 'portaudio')
optdepends=('hamradio-menus: XDG compliant menuing')
makedepends=('cmake' 'git')
provides=('kochmorse')
conflicts=('kochmorse' 'kochmorse-py')
source=("$_pkgname::git+$url.git#branch=master")

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	msg "Preparing sources..."

	sed -i -e s:'Teaching;':'Application;HamRadio': shared/$_pkgname.desktop
	sed -i '$ a X-DCOP-ServiceType=none' shared/$_pkgname.desktop
	sed -i '$ a X-KDE-SubstituteUID=false' shared/$_pkgname.desktop
}

build() {
	cd "$_pkgname"
	msg "Starting build..."

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE -DPORTAUDIO_INCLUDE_DIRS=/usr/include
	make
}

package() {
	cd "$_pkgname"
	msg "Starting packaging..."

	make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')
sha256sums=('SKIP')
