pkgname=kcm-pointing-devices-git
pkgver=r63.8d34a61
pkgrel=1
pkgdesc='Mouse/touchpad configuration module for KDE'
arch=(i686 x86_64)
url='https://github.com/amezin/pointing-devices-kcm'
license=(GPL)
depends=(kded kcmutils kdeclarative libxcb xcb-proto)
makedepends=(extra-cmake-modules qt5-tools)
source=('git://github.com/amezin/pointing-devices-kcm.git')
groups=(plasma)
md5sums=(SKIP)

pkgver() {
	cd pointing-devices-kcm
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../pointing-devices-kcm \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DSYSCONF_INSTALL_DIR=/etc \
		-DBUILD_TESTING=OFF
	make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
