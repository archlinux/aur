# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=rclone-browser
pkgver=1.5
pkgrel=1
pkgdesc='Simple cross-platform GUI for rclone'
url='https://github.com/kapitainsky/RcloneBrowser'
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kapitainsky/RcloneBrowser/archive/${pkgver}.tar.gz")
sha256sums=('dd0ad412ece7f764ae047c58f2c1e703e5882c848adb858229e7e0b84927cde0')
makedepends=('cmake')
depends=('qt5-base' 'rclone')

package() {
	cd "$srcdir"/RcloneBrowser-${pkgver}
	sed -i 's/ -Werror//g' src/CMakeLists.txt
	mkdir -p build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DCMAKE_BUILD_TYPE=Release
	cmake --build . --target install
	install -Dm644 "$srcdir"/RcloneBrowser-${pkgver}/LICENSE \
                "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
