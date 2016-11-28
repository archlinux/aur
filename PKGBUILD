# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-smoothstream-git
pkgver=r40.b15e6e6
pkgrel=1
pkgdesc="SmoothStreamingMedia file addon for Kodi 17+"
arch=('x86_64' 'i686')
url="https://github.com/peak3d/inputstream.smoothstream"
license=('GPL2')
depends=('kodi-platform-git>=r53')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('kodi-addon-inputstream-smoothstream-git::git+https://github.com/peak3d/inputstream.smoothstream.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
        cmake \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
