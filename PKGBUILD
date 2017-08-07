# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-rtmp-git
pkgver=r37.6c1af46
pkgrel=1
pkgdesc="librtmp support for Kodi 17+"
arch=('x86_64' 'i686')
url="https://github.com/notspiff/inputstream.rtmp"
license=('GPL2')
depends=('rtmpdump')
makedepends=('kodi-dev')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#kodi 17
source=('kodi-addon-inputstream-rtmp-git::git+https://github.com/notspiff/inputstream.rtmp.git#commit=6c1af46')
#kodi 18
# source=('kodi-addon-inputstream-rtmp-git::git+https://github.com/notspiff/inputstream.rtmp.git')
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
