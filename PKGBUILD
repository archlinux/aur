# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.8.2
pkgrel=1
_colname="alex-c-collections"
_colver="1.1.0"
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=(
	"https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	"https://github.com/alex-courtis/${_colname}/archive/refs/tags/v${_colver}.tar.gz"
)
sha256sums=(
'45fb6609c26ab19eb7d07c714016db32cb738b7a3274b344d94928e8b552a58e'
'2046dfb4f0b367692fdf4a77eb86cfa5741f159bec6e0b190fc906c68d25e8bd'
)
install=way-displays.install

prepare() {
	cd "${pkgname}-${pkgver}/lib"
	rmdir "${_colname}"
	ln -s "../../${_colname}-${_colver}" "${_colname}"
}

build() {
	cd "${pkgname}-${pkgver}"
	make CC=gcc CXX=g++ way-displays
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

