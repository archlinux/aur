# Maintainer: Syping <aur@syping.de>
pkgname=gta5view
pkgver=1.10.2
pkgrel=1
epoch=
pkgdesc="Open Source Snapmatic and Savegame viewer/editor for GTA V"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gta5view.syping.de/"
license=('GPL')
depends=(qt5-base qt5-svg qt5-translations)
makedepends=(cmake gcc git make qt5-base qt5-svg qt5-tools qt5-translations)
provides=("$pkgname")
source=("https://github.com/SyDevTeam/gta5view/archive/20de3627d563a70924304408949914d64126ffb3.tar.gz")
sha256sums=("ffbab0ac501625ba4626f010edfa893bf6bb220d4a092af02b2f3b1cca927b21")

build() {
    mkdir -p "$pkgname-20de3627d563a70924304408949914d64126ffb3.build"
    cd "$pkgname-20de3627d563a70924304408949914d64126ffb3.build"
    cmake "-GUnix Makefiles" \
          "-DCMAKE_BUILD_TYPE=Release" \
          "-DCMAKE_INSTALL_PREFIX=/usr" \
          "-DGTA5VIEW_BUILDTYPE=Release" \
          "-DQCONF_BUILD=ON" \
          "-DFORCE_QT_VERSION=5" \
          "../$pkgname-20de3627d563a70924304408949914d64126ffb3"
    make
}

package() {
    cd "$pkgname-20de3627d563a70924304408949914d64126ffb3.build"
    make DESTDIR="$pkgdir/" install
}