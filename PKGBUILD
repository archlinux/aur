# Maintainer: éclairevoyant
# Contributor: Milan Toth <milgra at milgra dot com>

pkgname=sov
pkgver=0.94
pkgrel=1
pkgdesc='Overview application for sway'
arch=(i686 x86_64)
url="https://github.com/milgra/$pkgname"
license=(GPL3)
depends=(freetype2 glew libegl libgl libpng libxkbcommon wayland)
makedepends=(meson wayland-protocols)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.sha256sum})
sha256sums=('ba5ab965093ead9e549c1e92e943a3eb3e9fe431d4859e1d2f840cc700eba34f'
            'e2f59931c66563d729722eef4dc3ef26a500efe37f52f818c220da96805da28b')

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
