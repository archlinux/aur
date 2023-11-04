# Maintainer: éclairevoyant
# Contributor: Milan Toth <milgra at milgra dot com>

pkgname=sov
pkgver=0.93
pkgrel=1
pkgdesc='Overview application for sway'
arch=(i686 x86_64)
url="https://github.com/milgra/$pkgname"
license=(GPL3)
depends=(freetype2 glew libegl libgl libpng libxkbcommon wayland)
makedepends=(meson wayland-protocols)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.sha256sum})
sha256sums=('ee6218915bcac2b7a6ea9314e4fa6fd6e9fd3f3d62513ddc9334b130b36262f2'
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
