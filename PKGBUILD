# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

_pkgname=lxqt-qtplugin
pkgname=lxqt-qt5plugin
pkgver=1.4.1
pkgrel=2
pkgdesc="LXQt platform integration for Qt"
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$_pkgname"
# https://github.com/lxqt/lxqt-qtplugin/blob/1.4.1/AUTHORS#L8
license=("LGPL-2.1-or-later")
depends=("libdbusmenu-qt5" "libqt5xdg" "qt5-x11extras" "libfm-qt5" "libQt5XdgIconLoader.so")
makedepends=("git" "lxqt-build-tools-qt5")
source=(
	"git+https://github.com/lxqt/$_pkgname?signed#tag=$pkgver"
)
sha256sums=('35275cd161863119fe3bccdebd82e56d5d38207820afb3c25c4eeb97a21f8f9f')
validpgpkeys=(
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)

build() {
	cmake -B build -S "$srcdir/$_pkgname" \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=None \
	  -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
