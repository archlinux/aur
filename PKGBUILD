# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=rclone-browser
pkgver=1.7.0
pkgrel=0
pkgdesc='Simple cross-platform GUI for rclone'
url='https://github.com/kapitainsky/RcloneBrowser'
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kapitainsky/RcloneBrowser/archive/${pkgver}.tar.gz")
sha256sums=('add7eb35fa521e87eddf9cfb36ddd11983f6fc78f520c3a887d353b574e3f083')
makedepends=('cmake')
depends=('qt5-base' 'rclone')

prepare() {
	cd "$srcdir/RcloneBrowser-${pkgver}"
	sed -i 's/ -Werror//g' src/CMakeLists.txt
}

build() {
	cd "${srcdir}/RcloneBrowser-${pkgver}"
	mkdir build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release
}

package() {
	cd "${srcdir}/RcloneBrowser-${pkgver}/build"
	cmake --build . --target install
	install -Dm644 "$srcdir"/RcloneBrowser-${pkgver}/LICENSE \
                "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
