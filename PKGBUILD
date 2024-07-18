# Maintainer: redstrate <josh@redstrate.com>

pkgname=astra-launcher
pkgver=0.6.1
pkgrel=2
pkgdesc="Cross-platform FFXIV launcher"
arch=('x86_64')
url="https://github.com/redstrate/Astra"
license=('GPL3')
depends=('qt6-base' 'quazip-qt6' 'qtkeychain-qt6' 'unshield' 'qt6-declarative' 'qt6-webview' 'kirigami' 'ki18n' 'kconfig' 'kcoreaddons' 'karchive' 'qcoro-qt6' 'gamemode' 'qqc2-desktop-style' 'kirigami-addons')
makedepends=('cmake' 'git' 'corrosion' 'extra-cmake-modules' 'zlib-ng') # git is needed for some cmake operations
source=("$pkgname-$pkgver::https://xiv.zone/distrib/astra/$pkgver/astra-source.tar.gz")
sha256sums=('904f5efab48f87c64fc59c1748354b41bbe5c991d47499332603071bd67f6596')

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

