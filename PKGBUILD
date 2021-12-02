# Maintainer: Epix <epixtm@protonmail.com>
pkgname=plasma5-wallpapers-wallpaper-engine-git
pkgver=r238.8a53a6a
pkgrel=1
pkgdesc="A simple kde wallpaper plugin integrating wallpaper engine"
arch=('any')
url="https://github.com/catsout/wallpaper-engine-kde-plugin"
license=('GPL2')
depends=('mpv' 'qt5-declarative' 'python-websockets' 'plasma-framework' 'qt5-websockets' 'qt5-webchannel')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("plasma5-wallpapers-wallpaper-engine-git::git+https://github.com/catsout/wallpaper-engine-kde-plugin.git")
md5sums=('SKIP')
build() {
	cd "$pkgname"
	mkdir -p build && cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) ..
	make
}
package() {
	cd "$pkgname"
	cd build
	make DESTDIR="$pkgdir/" install
}
pkgver() {
	cd "$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
