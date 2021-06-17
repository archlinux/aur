# Maintainer: Syping <aur@syping.de>
pkgname=gta5view
pkgver=1.10.1
pkgrel=1
epoch=
pkgdesc="Open Source Snapmatic and Savegame viewer/editor for GTA V"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gta5view.syping.de/"
license=('GPL')
depends=(qt5-base qt5-svg qt5-translations)
makedepends=(cmake gcc git make qt5-base qt5-svg qt5-tools qt5-translations)
provides=("$pkgname")
source=("https://github.com/SyDevTeam/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("ecb0e723fc0325a35dd2f8d8e918c142bcd6dc65ce76913cf1d3063f5e476a14")

build() {
    mkdir -p "$pkgname-$pkgver.build"
    cd "$pkgname-$pkgver.build"
    cmake "-GUnix Makefiles" \
          "-DCMAKE_BUILD_TYPE=Release" \
          "-DCMAKE_INSTALL_PREFIX=/usr" \
          "-DGTA5VIEW_BUILDTYPE=Release" \
          "-DQCONF_BUILD=ON" \
          "-DFORCE_QT_VERSION=5" \
          "../$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver.build"
    make DESTDIR="$pkgdir/" install
}
