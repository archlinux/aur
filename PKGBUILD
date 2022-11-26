# Maintainer: Norman Dubert <sfiveo13 at gmail dot com>
pkgname=tachidesk-qtui
pkgver=2022.11.26
pkgrel=1
pkgdesc="A free and open source manga read that runs extensions built for Tachiyomi"
arch=(any)
url="https://github.com/Suwayomi/Tachidesk-QtUI"
license=('MIT')
depends=('qt6-websockets' 'qt6-base' 'qt6-5compat' 'qt6-declarative' 'qt6-shadertools' 'qt6-imageformats')
makedepends=('cmake' 'git')
provides=("tachidesk-qtui")
source=("git+https://github.com/Suwayomi/Tachidesk-QtUI"
        "git+https://github.com/CasparKielwein/SortFilterProxyModel"
        "git+https://github.com/mgn-norm/QmlBridgeForMaterialDesignIcons")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $srcdir/Tachidesk-QtUI
  git submodule init
  git config submodule.libs/SortFilterProxyModel.url "$srcdir/SortFilterProxyModel"
  git config submodule.libs/QmlBridgeForMaterialDesignIcons.url "$srcdir/QmlBridgeForMaterialDesignIcons"
  git -c protocol.file.allow=always submodule update
  mkdir -p build
}

build() {
	cd $srcdir/Tachidesk-QtUI/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {
	cd $srcdir/Tachidesk-QtUI/build
	make DESTDIR="$pkgdir" install
}
