# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=1.5.0
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL-2.0-only')
depends=(
    'elfutils'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kddockwidgets-qt6'
    'kgraphviewer'
    'ki18n'
    'kio'
    'kitemmodels'
    'kitemviews'
    'kparts'
    'libelf'
    'perf'
    # 'qcustomplot' # currently it doesn't build
    'qt6-base>=6.4'
    'rustc-demangle>=0.1.18-2'
    'solid'
    'syntax-highlighting'
    'threadweaver'
)
makedepends=('cmake>=3.16.0' 'desktop-file-utils' 'extra-cmake-modules')
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('930f256fbe94068145d9366c1c7d0a1a75fca955d70d1acd9d698a888c7249404a832e579883f1bf18268578a664e10fdbb870ef328b51d55e8d1b59cb830da4')

build() {
    cd $pkgname-v$pkgver
    cmake -DBUILD_TESTING=off -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQT6_BUILD=on .
    cmake --build .
}

package() {
    cd $pkgname-v$pkgver
    DESTDIR="$pkgdir" cmake --install .
    desktop-file-install com.kdab.hotspot.desktop --dir="$pkgdir/usr/share/applications/"
}
