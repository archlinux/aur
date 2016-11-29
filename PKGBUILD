# Contributor: Weng Xuetian <wengxt@gmail.com>
# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
# Why I create this package : the existing kmozillahelper-frameworks still lacks some function.
pkgname=kmozillahelper-kf5
pkgver=0.6.4
pkgrel=3
pkgdesc="Mozilla KDE Integration. KF5 port with kdelibs4support."
url="https://build.opensuse.org/package/show/openSUSE:Factory/mozilla-kde4-integration"
arch=("i686" "x86_64")
license=('MIT')
depends=("kdelibs4support")
makedepends=("cmake" "automoc4" "extra-cmake-modules")
provides=(kmozillahelper-frameworks kmozillahelper)
conflicts=(kmozillahelper-frameworks kmozillahelper)
source=("${pkgname%%-kf5}-${pkgver}.tar.gz::https://github.com/openSUSE/kmozillahelper/archive/${pkgver}.tar.gz" "port_to_kf5.patch")

prepare() {
	cd ${pkgname%%-kf5}-${pkgver}
	patch -p1 -i "$srcdir/port_to_kf5.patch"
}

build() {
	mkdir -p "$srcdir/$pkgname-build"
	cd "$srcdir/$pkgname-build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF \
	-DCMAKE_BUILD_TYPE=Release "$srcdir/${pkgname%%-kf5}-${pkgver}"
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-build"
	make DESTDIR="$pkgdir" install
}

md5sums=('0c7252a1937514f84cad21615c8eeacc' 'a1f5a226ad839339c4a24b9bf671e2d5')
