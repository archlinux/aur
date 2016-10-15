# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-mpd-git
pkgver=r189.075cd2b
pkgrel=1
pkgdesc="MPEG-DASH mpd file addon for Kodi 17+"
arch=('x86_64' 'i686')
url="https://github.com/peak3d/inputstream.mpd"
license=('GPL2')
depends=('kodi-platform-git>=r53')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('kodi-addon-inputstream-mpd-git::git+https://github.com/peak3d/inputstream.mpd.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=/usr/lib \
            -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib \
            -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
