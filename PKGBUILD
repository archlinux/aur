# Maintainer: redstrate <josh@redstrate.com>

pkgname=astra-launcher
pkgver=0.4.1
pkgrel=1
pkgdesc="Cross-platform FFXIV launcher"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/astra"
license=('GPL3')
depends=('qt5-base' 'quazip-qt5' 'qtkeychain-qt5' 'libxcomposite' 'unshield' 'fmt' 'pugixml') # this x11 dependency is going to be removed in a future release
makedepends=('cmake' 'git') # git is needed for some cmake operations
source=("$pkgname-$pkgver::https://xiv.zone/distrib/astra/$pkgver/astra-source.tar.gz") # sorry about the -beta on tags, this will be removed in the near future
sha256sums=('efcf6fcce293818b94b03d2016e5fe87afd07e5d7e6b4f7e58b26bf043af0c71')

build() {
    cmake -DCMAKE_BUILD_TYPE=Release -DUSE_OWN_LIBRARIES=OFF ./
    cmake --build ./
}

package() {
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
    find "$pkgdir" -type d -name ".git" -exec rm -r '{}' +
}

