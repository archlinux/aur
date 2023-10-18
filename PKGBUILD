# Maintainer: akku <akku[at]mirai[dot]re>
pkgname=fcitx5-tmux-git
# Because the developer has not set the version.
pkgver=r5.35daf5d
pkgrel=1
pkgdesc="Tmux plugin to make tmux as a fcitx 5 client"
arch=('any')
url="https://github.com/wengxt/fcitx5-tmux"
license=('GPLv2')
depends=('dbus' 'fcitx5' 'tmux')
makedepends=('git' 'cmake')
source=("${pkgname}"::'git+https://github.com/wengxt/fcitx5-tmux.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/fcitx5-tmux
	cmake --build .
}

package() {
	cd "${srcdir}/${pkgname}/build"
	DESTDIR=${pkgdir} cmake --install .
}
