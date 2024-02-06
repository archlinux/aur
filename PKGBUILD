# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor:  Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=20240201
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL2')
depends=('qt5-base>=5.15.0' 'libelf' 'elfutils' 'threadweaver5' 'kddockwidgets' 'ki18n5' 'kconfig5' 'kio5' 'kitemviews5' 'kcoreaddons5' 'kitemmodels5' 'kconfigwidgets5' 'kparts5' 'perf' 'solid5' 'rustc-demangle>=0.1.18-2')
makedepends=('cmake>=3.16.0' 'desktop-file-utils' 'extra-cmake-modules' 'git')
source=("git+$url#commit=95ecb77fbd8b0ab985c79d8c46659eee69ba95d5")
b2sums=('SKIP')

prepare() {
    cd $pkgname
    git submodule update --init --recursive
}

build() {
    cd $pkgname
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=off .
    cmake --build .
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install .
    desktop-file-install com.kdab.hotspot.desktop --dir="$pkgdir/usr/share/applications/"
}
