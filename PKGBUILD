# Maintainer: éclairevoyant
# Contributor: Milan Toth <milgra at milgra dot com>

pkgname=sov
pkgver=0.92b
pkgrel=1
pkgdesc='Overview application for sway'
arch=(i686 x86_64)
url="https://github.com/milgra/$pkgname"
license=(GPL3)
depends=(freetype2 glew libegl libgl libpng libxkbcommon wayland)
makedepends=(meson wayland-protocols)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.sha256sum})
sha256sums=('946c711131fda1d795675c3097dc1b4cb60db771bb379b57e19727404b48460b'
            'SKIP')

prepare() {
	sha256sum -c $pkgname-$pkgver.tar.xz.sha256sum
}

build() {
	arch-meson $pkgname-$pkgver build --buildtype=release
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
