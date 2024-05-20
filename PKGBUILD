# Maintainer: redstrate <josh@redstrate.com>

pkgname=astra-launcher
pkgver=0.5.1
pkgrel=2
pkgdesc="Cross-platform FFXIV launcher"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/astra"
license=('GPL3')
depends=('qt6-base' 'quazip-qt6' 'qtkeychain-qt6' 'unshield' 'qt6-declarative' 'qt6-webview' 'kirigami' 'ki18n' 'kconfig' 'kcoreaddons' 'karchive' 'qcoro-qt6' 'gamemode' 'qqc2-desktop-style' 'kirigami-addons')
makedepends=('cmake' 'git' 'corrosion' 'extra-cmake-modules') # git is needed for some cmake operations
source=("$pkgname-$pkgver::https://xiv.zone/distrib/astra/$pkgver/astra-source.tar.gz")
sha256sums=('9c882e43cf9e1ddc919345ec889bc9328430e4f97430c6673886bf317e28fc64')

build() {
    cmake -DCMAKE_BUILD_TYPE=Release -DUSE_OWN_LIBRARIES=OFF ./
    cmake --build ./
}

package() {
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
    find "$pkgdir" -type d -name ".git" -exec rm -r '{}' +
}

