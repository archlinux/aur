# Maintainer: redstrate <josh@redstrate.com>

pkgname=astra-launcher
pkgver=0.6.0
pkgrel=2
pkgdesc="Cross-platform FFXIV launcher"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/astra"
license=('GPL3')
depends=('qt6-base' 'quazip-qt6' 'qtkeychain-qt6' 'unshield' 'qt6-declarative' 'qt6-webview' 'kirigami' 'ki18n' 'kconfig' 'kcoreaddons' 'karchive' 'qcoro-qt6' 'gamemode' 'qqc2-desktop-style' 'kirigami-addons')
makedepends=('cmake' 'git' 'corrosion' 'extra-cmake-modules' 'zlib-ng') # git is needed for some cmake operations
source=("$pkgname-$pkgver::https://xiv.zone/distrib/astra/$pkgver/astra-source.tar.gz")
sha256sums=('e5b081f71d867d72ccc766fcf14938be9646d657653fb54c3a7a74d25ff9973d')

build() {
    # TODO: figure out why this zlib-ng hack is needed on arch
    cmake -DCMAKE_BUILD_TYPE=Release -DUSE_OWN_LIBRARIES=OFF -DCMAKE_CXX_STANDARD_LIBRARIES="-lz-ng" ./
    cmake --build ./
}

package() {
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
    find "$pkgdir" -type d -name ".git" -exec rm -r '{}' +
}

